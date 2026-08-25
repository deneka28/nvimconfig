require("aerial").setup({
	layout = {
		min_width = 30,
		default_direction = "prefer_right",
	},
	backends = { "treesitter", "lsp" },
	filter_kind = false, -- показывать всё (важно для QML)
})
