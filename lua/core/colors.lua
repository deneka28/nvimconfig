vim.opt.termguicolors = true

-- Функция для установки кастомных highlight групп
local function set_custom_highlights()
	-- Убрать фон у некоторых элементов
	vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })

	-- Цвета для отступов (indent-blankline)
	vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b3f4c" })
	vim.api.nvim_set_hl(0, "IblWhitespace", { fg = "#3b3f4c" })

	-- Диагностика - Ошибки
	vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#F92672" })
	vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#F92672" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", { sp = "#F92672", undercurl = true })

	-- Диагностика - Предупреждения
	vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#E6DB74" })
	vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#E6DB74" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", { sp = "#E6DB74", undercurl = true })

	-- Диагностика - Подсказки
	vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#66D9EF" })
	vim.api.nvim_set_hl(0, "DiagnosticSignHint", { fg = "#66D9EF" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineHint", { sp = "#66D9EF", undercurl = true })

	-- Диагностика - Информация
	vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#A6E22E" })
	vim.api.nvim_set_hl(0, "DiagnosticSignInfo", { fg = "#A6E22E" })
	vim.api.nvim_set_hl(0, "DiagnosticUnderlineInfo", { sp = "#A6E22E", undercurl = true })
end

-- Создаём autocmd ОДИН РАЗ (вне функции SetColor)
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		set_custom_highlights()
	end,
})

-- Функция для смены темы
function SetColor(color)
	color = color or "tokyonight-moon"
	vim.cmd.colorscheme(color)

	-- Применяем кастомные highlight сразу после установки темы
	set_custom_highlights()
end

-- Устанавливаем тему при запуске
SetColor()
