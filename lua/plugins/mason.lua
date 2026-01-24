require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "qmlls" },
})
-- local lspconfig = require("lspconfig")

--vim.lsp.config.qmlls.setup({
--	cmd = { "qmlls6" }, -- важно!
--	filetypes = { "qml", "qmljs" },
--	root_dir = vim.lsp.config.util.root_pattern("qmlproject", ".git"),
--})
