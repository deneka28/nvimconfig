-- Lua (Neovim)
vim.lsp.config.lua_ls = {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}

-- QML / Qt6

vim.lsp.config.qmlls = {
	cmd = { "/lib/qt6/bin/qmlls", "-I", "/usr/lib/qt6/qml" },
	--cmd = { "qmlls6", "-E" },
	root_markers = { "qmldir", ".git", "qmldir" },
	filetypes = { "qml", "qmljs" },
	settings = {
    qml = {
      validate = true,
      qtInstallation = "/usr/lib/qt6",
      completion = {
        enable = true,
      },
		},
	},
}
vim.lsp.enable({ "qmlls", "lua_ls" })


