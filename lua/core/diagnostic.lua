vim.diagnostic.config({
  virtual_text = true,       -- как VS Code: без inline текста
  signs = true,               -- иконки слева
  underline = true,           -- подчёркивание
  update_in_insert = false,   -- не мешает при наборе
  severity_sort = true,
  float = {
    border = "rounded",
    source = true --"always",
  },
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
vim.opt.updatetime = 250
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

vim.keymap.set("n", "<leader>dv", function()
  local vt = vim.diagnostic.config().virtual_text
  vim.diagnostic.config({ virtual_text = not vt })
end)
