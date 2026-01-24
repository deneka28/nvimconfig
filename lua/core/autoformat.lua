-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	callback = function(args)
-- 		vim.lsp.buf.format({
-- 			bufnr = args.buf,
-- 			timeout_ms = 2000,
-- 		})
-- 	end,
-- })
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client.name == "qmlls" then
			-- client.server_capabilities.documentFormattingProvider = false
		end
	end,
})
-- vim.keymap.set("n", "<leader>fm", function()
-- 	vim.lsp.buf.format()
-- end, { desc = "Format buffer" })
