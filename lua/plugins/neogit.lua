require("neogit").setup({
vim.keymap.set(
    "n",
    "<leader>gg",
    function() neogit.open({ kind = "split" }) end,
    { desc = "Open Neogit UI" }
)
})
