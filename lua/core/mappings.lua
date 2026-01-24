vim.g.mapleader = " "

--Neo-tree
vim.keymap.set("n", "<leader>e", ":Neotree float focus<CR>")
vim.keymap.set("n", "<leader>og", ":Neotree float git_status<CR>")

vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist)
vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
end, { desc = "Prev diagnostic" })

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<leader>fo", ":lua vim.lsp.buf.format()<CR>", opts)
vim.keymap.set("n", "<leader>fm", function()
	require("conform").format({ lsp_fallback = true })
end, { desc = "Format buffer" })
