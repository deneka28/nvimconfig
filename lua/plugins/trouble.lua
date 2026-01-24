return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		focus = true,
		auto_close = true,
		auto_preview = true,
		use_diagnostic_signs = true,
	},
	keys = {
		{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
		{ "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix (Trouble)" },
		{ "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Loclist (Trouble)" },
		{ "<leader>xs", "<cmd>Trouble symbols toggle<cr>", desc = "Symbols (Trouble)" },
	},
}
