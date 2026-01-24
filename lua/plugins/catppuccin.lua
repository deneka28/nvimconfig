require("catppuccin").setup({
  flavour = "mocha",
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
    },
  },
})


