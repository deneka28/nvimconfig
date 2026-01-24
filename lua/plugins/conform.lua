require("conform").setup({
    formatters_by_ft = {
        qml = { "qmlformat" },
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
    },
    format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true,
    },
})
