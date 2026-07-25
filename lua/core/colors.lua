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

	-- Яркая, контрастная подсветка ключевых слов и типов (в т.ч. для QML: import, property,
	-- signal, function, readonly, required, id и т.д.)
	vim.api.nvim_set_hl(0, "@keyword", { fg = "#fc1a70" })
	vim.api.nvim_set_hl(0, "@keyword.function", { fg = "#62d8f1" })
	vim.api.nvim_set_hl(0, "@keyword.return", { fg = "#fc1a70" })
	vim.api.nvim_set_hl(0, "@keyword.import", { fg = "#fc1a70" })
	vim.api.nvim_set_hl(0, "@type", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "@type.builtin", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "@property", { fg = "#ff9700" })
	vim.api.nvim_set_hl(0, "@function", { fg = "#62d8f1" })
	vim.api.nvim_set_hl(0, "@string", { fg = "#ffff87" })
	vim.api.nvim_set_hl(0, "@number", { fg = "#af87ff" })
	vim.api.nvim_set_hl(0, "@variable", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "@variable.member", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "@variable.parameter", { fg = "#ffffff" })
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = "#3fa1ff" })
	vim.api.nvim_set_hl(0, "Operator", { fg = "#62d8f1" })
	vim.api.nvim_set_hl(0, "Boolean", { fg = "#af87ff" })

	-- LSP semantic tokens (qmlls и другие) могут перекрывать чистый treesitter-@type
	-- для имён QML-компонентов (Item, Rectangle и т.п.) — дублируем цвет и туда
	vim.api.nvim_set_hl(0, "@lsp.type.class", { fg = "#a4e400" })
	vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = "#a4e400" })
	vim.api.nvim_set_hl(0, "@lsp.type.interface", { fg = "#a4e400" })
	vim.api.nvim_set_hl(0, "@lsp.type.enum", { fg = "#a4e400" })
	vim.api.nvim_set_hl(0, "@lsp.type.method", { fg = "#a4e400" })
	vim.api.nvim_set_hl(0, "@lsp.type.namespace", { fg = "#ffffff" })
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
	color = color or "monokai-nightasty" --"tokyonight-moon"
	vim.cmd.colorscheme(color)

	-- Применяем кастомные highlight сразу после установки темы
	set_custom_highlights()
end

-- Устанавливаем тему при запуске
SetColor()
