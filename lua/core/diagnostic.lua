-- Настройка диагностики
vim.diagnostic.config({
	virtual_text = {
		-- Показывать только для ошибок и предупреждений
		severity = { min = vim.diagnostic.severity.WARN },
		-- Добавить префикс с иконкой
		prefix = "●",
		-- Форматирование текста
		format = function(diagnostic)
			-- Ограничить длину сообщения
			local message = diagnostic.message
			if #message > 80 then
				message = message:sub(1, 77) .. "..."
			end
			return message
		end,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✗",
			[vim.diagnostic.severity.WARN] = "⚠",
			[vim.diagnostic.severity.HINT] = "󰌵",
			[vim.diagnostic.severity.INFO] = "ℹ",
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
		header = "",
		prefix = "",
		-- Форматирование для float окна
		format = function(diagnostic)
			return string.format("%s: %s", diagnostic.source or "LSP", diagnostic.message)
		end,
	},
})

-- Задержка перед показом float окна
vim.opt.updatetime = 250

-- Автоматически показывать диагностику при наведении
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		-- Проверяем есть ли диагностика на текущей строке
		local opts = {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = " ",
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})

vim.keymap.set("n", "<leader>dv", function()
	local config = vim.diagnostic.config()
	if config.virtual_text then
		vim.diagnostic.config({ virtual_text = false })
	else
		vim.diagnostic.config({
			virtual_text = {
				severity = { min = vim.diagnostic.severity.WARN },
				prefix = "●",
				format = function(diagnostic)
					local message = diagnostic.message
					if #message > 80 then
						message = message:sub(1, 77) .. "..."
					end
					return message
				end,
			},
		})
	end
end, { desc = "Toggle Diagnostic Virtual Text" })
