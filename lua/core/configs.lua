vim.wo.number = true
vim.wo.relativenumber = true

vim.g.formatoptions = "qrn1"
vim.opt.wrap = false
vim.opt.shell = "/bin/fish"

vim.opt.mouse = "a"
vim.opt.mousefocus = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.winborder = "rounded"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.clipboard = "unnamedplus"

local group = vim.api.nvim_create_augroup("LspDocumentHighlight", { clear = true })

vim.api.nvim_create_autocmd("LspAttach", {
	group = group,
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client and client.server_capabilities.documentHighlightProvider then
			local bufnr = args.buf

			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = bufnr,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = bufnr,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})
