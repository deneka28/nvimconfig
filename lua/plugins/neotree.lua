vim.cmd([[ let g:neo_tree_remove_legacy_c0mmands = 1 ]])

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "✗",
			[vim.diagnostic.severity.WARN] = "⚠",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "ℹ",
		},
	},
})

require("neo-tree").setup({

	popup_border_style = "rounded",
	window = {
		width = 25,
		position = "float",
	},
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
		},
	},
})
