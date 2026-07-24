-- plugins/treesitter.lua
require("nvim-treesitter").setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

local parsers = { "lua", "vim", "vimdoc", "qmljs", "qmldir", "javascript" }

-- Явная установка парсеров (проверяет, что уже стоит, лишний раз не переустанавливает)
require("nvim-treesitter").install(parsers)

-- Явное включение подсветки и отступов через treesitter для нужных filetype
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "vim", "vimdoc", "qml", "qmljs", "javascript" },
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
