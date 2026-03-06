vim.cmd([[ let g:neo_tree_remove_legacy_c0mmands = 1 ]])

-- vim.fn.sign_define("DiagnosticSignError",
-- { text = " ", texthl = "DiagnosticSignError" })
--    vim.fn.sign_define("DiagnosticSignWarn",
-- { text = " ", texthl = "DiagnosticSignWarn" })
-- vim.fn.sign_define("DiagnosticSignInfo",
-- { text = " ", texthl = "DiagnosticSignInfo" })
-- vim.fn.sign_define("DiagnosticSignHint",
-- { text = "󰌵", texthl = "DiagnosticSignHint" })
--
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
	window = {
		width = 25,
		-- border = "rounded",
		popup_border_style = "rounded",
	},
	filesystem = {
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = true,
		},
	},
})
