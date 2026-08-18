-- plugins/treesitter.lua
require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

local parsers = { "lua", "vim", "vimdoc", "qmljs", "qmldir", "javascript", "cpp", "c", "h", "hpp" }

-- Явная установка парсеров (проверяет, что уже стоит, лишний раз не переустанавливает)
require("nvim-treesitter").install(parsers)

-- Подсветка через treesitter для всех перечисленных filetype
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "vim", "vimdoc", "qml", "qmljs", "javascript", "cpp", "c", "h", "hpp" },
	callback = function()
		vim.treesitter.start()
	end,
})

-- Отступы через treesitter — ТОЛЬКО там, где для языка есть queries/<lang>/indents.scm
-- (у qmljs/vim/vimdoc такого файла нет, там treesitter-indentexpr просто
-- откатывается на "отступ как у предыдущей строки", что хуже дефолта Neovim)
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "javascript" },
	callback = function()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
