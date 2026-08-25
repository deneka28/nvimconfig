vim.g.mapleader = " "

local opts = {
	noremap = true,
	silent = true,
}

-- Save
vim.keymap.set("n", "<leader>w", "<cmd>w<cr>", {
	desc = "Save file",
})

-- Quit
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", {
	desc = "Quit Neovim",
})

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Diagnostics
vim.keymap.set("n", "]d", function()
	vim.diagnostic.jump({
		count = 1,
	})
end, {
	desc = "Next diagnostic",
})

vim.keymap.set("n", "[d", function()
	vim.diagnostic.jump({
		count = -1,
	})
end, {
	desc = "Previous diagnostic",
})
