require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mason-lspconfig").setup({
	ensure_installed = { "qmlls", "ruff" },
})
-- local lspconfig = require("lspconfig")
--
-- -- Общие привязки клавиш при подключении LSP
-- local on_attach = function(client, bufnr)
-- 	local opts = { buffer = bufnr, remap = false }
-- 	vim.keymap.set("n", "gd", function()
-- 		vim.lsp.buf.definition()
-- 	end, opts)
-- 	vim.keymap.set("n", "K", function()
-- 		vim.lsp.buf.hover()
-- 	end, opts)
-- 	vim.keymap.set("n", "<leader>vws", function()
-- 		vim.lsp.buf.workspace_symbol()
-- 	end, opts)
-- 	vim.keymap.set("n", "<leader>vd", function()
-- 		vim.diagnostic.open_float()
-- 	end, opts)
-- 	vim.keymap.set("n", "<leader>ca", function()
-- 		vim.lsp.buf.code_action()
-- 	end, opts)
-- 	vim.keymap.set("n", "<leader>rn", function()
-- 		vim.lsp.buf.rename()
-- 	end, opts)
-- end
--
-- -- Запуск Pyright
-- lspconfig.pyright.setup({
-- 	on_attach = on_attach,
-- 	settings = {
-- 		python = {
-- 			analysis = {
-- 				autoSearchPaths = true,
-- 				typeCheckingMode = "basic",
-- 				useLibraryCodeForTypes = true,
-- 			},
-- 		},
-- 	},
-- })
--
-- -- Запуск Ruff (для мгновенного линтинга)
-- lspconfig.ruff.setup({
-- 	on_attach = on_attach,
-- })
