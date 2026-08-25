require("conform").setup({

	formatters = {
		qmlformat = {
			command = "/lib/qt6/bin/qmlformat",
			-- -f/--force: не отказываться молча, если qmlformat не может
			-- гарантировать, что переформатированный файл семантически
			-- идентичен исходному (см. https://doc.qt.io/qt-6/qtqml-tooling-qmlformat.html)
			args = { "-i", "$FILENAME" },
		},
	},
	formatters_by_ft = {
		qml = { "qmlformat" },
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		c = { "clang_format" },
		cpp = { "clang_format" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
