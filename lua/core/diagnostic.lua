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

-- Keymaps для работы с диагностикой
local opts = { noremap = true, silent = true }

-- Toggle virtual text
vim.keymap.set("n", "<leader>dv", function()
	local config = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = not config.virtual_text,
	})
end, { desc = "Toggle Diagnostic Virtual Text" })

-- Показать диагностику в floating окне
vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { desc = "Show Diagnostics" })

-- Перейти к следующей/предыдущей диагностике
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })

-- Перейти к следующей/предыдущей ошибке (только ERROR)
vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Next Error" })

vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Previous Error" })

-- Показать список всех диагностик в loclist
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics to Loclist" })

-- Показать список всех диагностик в quickfix
vim.keymap.set("n", "<leader>dq", vim.diagnostic.setqflist, { desc = "Diagnostics to Quickfix" })
