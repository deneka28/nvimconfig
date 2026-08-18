-- -- Lua (Neovim)
-- vim.lsp.config.lua_ls = {
-- 	settings = {
-- 		Lua = {
-- 			runtime = { version = "LuaJIT" },
-- 			diagnostics = {
-- 				globals = { "vim" },
-- 			},
-- 			workspace = {
-- 				library = vim.api.nvim_get_runtime_file("", true),
-- 				checkThirdParty = false,
-- 			},
-- 			telemetry = { enable = false },
-- 		},
-- 	},
-- }
--
-- -- QML / Qt6
--
-- vim.lsp.config.qmlls = {
-- 	cmd = { "/lib/qt6/bin/qmlls", "-I", "/usr/lib/qt6/qml" },
-- 	--cmd = { "qmlls6", "-E" },
-- 	root_markers = { "qmldir", ".git", "qmldir" },
-- 	filetypes = { "qml", "qmljs" },
-- 	settings = {
-- 		qml = {
-- 			validate = true,
-- 			qtInstallation = "/usr/lib/qt6",
-- 			completion = {
-- 				enable = true,
-- 			},
-- 		},
-- 	},
-- }
-- vim.lsp.enable({ "qmlls", "lua_ls", "pyright" })
--
-- Единые capabilities для всех LSP-серверов (расширенное автодополнение от nvim-cmp)
local capabilities = require("cmp_nvim_lsp").default_capabilities()
vim.lsp.config.clangd = {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--fallback-style=LLVM",
	},

	filetypes = {
		"c",
		"cpp",
		"objc",
		"objcpp",
		"cuda",
	},

	root_markers = {
		"compile_commands.json",
		"compile_flags.txt",
		".git",
	},

	capabilities = capabilities,
}
-- Lua (Neovim)
vim.lsp.config.lua_ls = {
	capabilities = capabilities,
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
	filetypes = { "qml", "qmljs" },
	root_markers = { "qmldir", ".git" },
	capabilities = capabilities,

	on_attach = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,

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
vim.lsp.config.pyright = {
	capabilities = capabilities,
}

vim.lsp.enable({ "qmlls", "lua_ls", "pyright", "clangd" })
