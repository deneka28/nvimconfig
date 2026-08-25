local colors = {
	pink = "#fc1a70",
	cyan = "#62d8f1",
	orange = "#ff9700",
	green = "#a4e400",
	purple = "#af87ff",

	white = "#ffffff",
	grey = "#3b3f4c",
	dark = "#1b1d23",
	black = "#101116",
}

local theme = {
	normal = {
		a = {
			fg = colors.black,
			bg = colors.cyan,
			gui = "bold",
		},

		b = {
			fg = colors.white,
			bg = colors.grey,
		},

		c = {
			fg = colors.white,
			bg = colors.dark,
		},
	},

	insert = {
		a = {
			fg = colors.black,
			bg = colors.green,
			gui = "bold",
		},

		b = {
			fg = colors.white,
			bg = colors.grey,
		},

		c = {
			fg = colors.white,
			bg = colors.dark,
		},
	},

	visual = {
		a = {
			fg = colors.black,
			bg = colors.purple,
			gui = "bold",
		},

		b = {
			fg = colors.white,
			bg = colors.grey,
		},

		c = {
			fg = colors.white,
			bg = colors.dark,
		},
	},

	replace = {
		a = {
			fg = colors.black,
			bg = colors.pink,
			gui = "bold",
		},

		b = {
			fg = colors.white,
			bg = colors.grey,
		},

		c = {
			fg = colors.white,
			bg = colors.dark,
		},
	},

	command = {
		a = {
			fg = colors.black,
			bg = colors.orange,
			gui = "bold",
		},

		b = {
			fg = colors.white,
			bg = colors.grey,
		},

		c = {
			fg = colors.white,
			bg = colors.dark,
		},
	},

	inactive = {
		a = {
			fg = colors.white,
			bg = colors.dark,
		},

		b = {
			fg = colors.white,
			bg = colors.dark,
		},

		c = {
			fg = colors.white,
			bg = colors.dark,
		},
	},
}

require("lualine").setup({
	options = {
		theme = theme,

		component_separators = {
			left = "│",
			right = "│",
		},

		section_separators = {
			left = "",
			right = "",
		},

		globalstatus = true,

		disabled_filetypes = {
			"alpha",
			"dashboard",
			"neo-tree",
			"NvimTree",
			"lazy",
			"mason",
		},
	},

	sections = {
		-- ┌──────────────┐
		-- │ NORMAL       │
		-- └──────────────┘
		lualine_a = {
			{
				"mode",
				separator = {
					left = "",
					right = "",
				},
				right_padding = 2,

				fmt = function(str)
					return str:upper()
				end,
			},
		},

		-- FILE / GIT
		lualine_b = {
			{
				"filename",

				path = 1,

				symbols = {
					modified = " ●",
					readonly = " 󰌾",
					unnamed = "[No Name]",
				},
			},

			{
				"branch",
				icon = "󰘬",
			},

			{
				"diff",

				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
			},
		},

		-- CENTER
		lualine_c = {
			{
				"diagnostics",

				sources = {
					"nvim_diagnostic",
				},

				symbols = {
					error = "󰅚 ",
					warn = "󰀪 ",
					info = "󰋽 ",
					hint = "󰌶 ",
				},
			},

			{
				function()
					local clients = vim.lsp.get_clients({
						bufnr = 0,
					})

					if #clients == 0 then
						return ""
					end

					local names = {}

					for _, client in ipairs(clients) do
						table.insert(names, client.name)
					end

					return table.concat(names, " ")
				end,

				icon = "󰞋 ",
			},
		},

		-- RIGHT
		lualine_x = {
			{
				"filetype",
				icon_only = false,
			},

			"encoding",

			"fileformat",
		},

		lualine_y = {
			{
				"progress",
			},
		},

		lualine_z = {
			{
				"location",

				separator = {
					left = "",
					right = "",
				},

				left_padding = 2,
			},
		},
	},

	inactive_sections = {
		lualine_a = {
			"filename",
		},

		lualine_b = {},

		lualine_c = {},

		lualine_x = {
			"filetype",
		},

		lualine_y = {},

		lualine_z = {
			"location",
		},
	},

	tabline = {},

	extensions = {
		"neo-tree",
		"lazy",
		"mason",
	},
})

vim.api.nvim_create_autocmd("User", {
	pattern = "LspProgressStatusUpdated",
	callback = function()
		require("lualine").refresh()
	end,
})
