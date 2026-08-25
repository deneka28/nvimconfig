local wk = require("which-key")

wk.setup({
	plugins = {
		marks = true,
		registers = true,

		spelling = {
			enabled = true,
			suggestions = 20,
		},

		presets = {
			operators = true,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},

	win = {
		border = "rounded",
		padding = { 1, 2 },

		title = true,
		title_pos = "center",
	},

	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 60 },
		spacing = 3,
		align = "left",
	},

	delay = 300,

	filter = function(mapping)
		return mapping.desc and mapping.desc ~= ""
	end,
})

-- ╭──────────────────────────────────────────────╮
-- │ LEADER GROUPS                                │
-- ╰──────────────────────────────────────────────╯

wk.add({
	-- ─────────────────────────────────────────────
	-- FILES
	-- ─────────────────────────────────────────────

	{ "<leader>e", "<cmd>Neotree float focus<cr>", desc = "Neo-tree" },
	{ "<leader>og", "<cmd>Neotree float git_status<cr>", desc = "Git status" },

	{
		"<leader>w",
		group = "Windows",
		icon = "󰖲",
	},

	{
		"<leader>f",
		group = "Find",
		icon = "󰍉",
	},

	{
		"<leader>b",
		group = "Buffers",
		icon = "󰓩",
	},

	{
		"<leader>c",
		group = "Code",
		icon = "󰅩",
	},

	{
		"<leader>d",
		group = "Diagnostics",
		icon = "󰒡",
	},

	{
		"<leader>g",
		group = "Git",
		icon = "󰊢",
	},

	{
		"<leader>t",
		group = "Trouble",
		icon = "󰔷",
	},

	{
		"<leader>s",
		group = "Noice",
		icon = "󰍩",
	},

	{
		"<leader>u",
		group = "UI",
		icon = "󰙵",
	},

	{
		"<leader>q",
		group = "Quit",
		icon = "󰗼",
	},

	{
		"<leader>x",
		group = "Trouble",
		icon = "󰔷",
	},

	{
		"<leader>h",
		group = "Git Hunk",
		icon = "󰊢",
	},

	{
		"<leader>m",
		group = "Misc",
		icon = "󰘵",
	},
})

-- ╭──────────────────────────────────────────────╮
-- │ FIND / TELESCOPE                             │
-- ╰──────────────────────────────────────────────╯

local builtin = require("telescope.builtin")

wk.add({
	{
		"<leader>ff",
		builtin.find_files,
		desc = "Find files",
	},

	{
		"<leader>fg",
		builtin.live_grep,
		desc = "Live grep",
	},

	{
		"<leader>fb",
		builtin.buffers,
		desc = "Buffers",
	},

	{
		"<leader>fh",
		builtin.help_tags,
		desc = "Help tags",
	},

	{
		"<leader>fr",
		builtin.oldfiles,
		desc = "Recent files",
	},

	{
		"<leader>fc",
		builtin.commands,
		desc = "Commands",
	},

	{
		"<leader>fk",
		builtin.keymaps,
		desc = "Keymaps",
	},

	{
		"<leader>fm",
		builtin.marks,
		desc = "Marks",
	},

	{
		"<leader>fs",
		builtin.current_buffer_fuzzy_find,
		desc = "Search buffer",
	},

	{
		"<leader>fo",
		builtin.vim_options,
		desc = "Vim options",
	},
})

-- ╭──────────────────────────────────────────────╮
-- │ BUFFERS                                      │
-- ╰──────────────────────────────────────────────╯

wk.add({
	{
		"<leader>be",
		"<cmd>enew<cr>",
		desc = "New buffer",
	},

	{
		"<leader>bd",
		"<cmd>bd<cr>",
		desc = "Delete buffer",
	},

	{
		"<leader>bo",
		"<cmd>%bd|e#|bd#<cr>",
		desc = "Delete other buffers",
	},

	{
		"<leader>bp",
		"<cmd>bprevious<cr>",
		desc = "Previous buffer",
	},

	{
		"<leader>bn",
		"<cmd>bnext<cr>",
		desc = "Next buffer",
	},
})
wk.add({
	{
		"<leader>ca",
		vim.lsp.buf.code_action,
		desc = "Code action",
	},

	{
		"<leader>cr",
		vim.lsp.buf.rename,
		desc = "Rename symbol",
	},

	{
		"<leader>cd",
		vim.lsp.buf.definition,
		desc = "Go to definition",
	},

	{
		"<leader>cD",
		vim.lsp.buf.declaration,
		desc = "Go to declaration",
	},

	{
		"<leader>ci",
		vim.lsp.buf.implementation,
		desc = "Go to implementation",
	},

	{
		"<leader>ct",
		vim.lsp.buf.type_definition,
		desc = "Type definition",
	},

	{
		"<leader>ch",
		vim.lsp.buf.hover,
		desc = "Hover documentation",
	},

	{
		"<leader>cs",
		vim.lsp.buf.signature_help,
		desc = "Signature help",
	},

	{
		"<leader>cf",
		function()
			vim.lsp.buf.format({
				async = true,
			})
		end,
		desc = "Format buffer",
	},

	{
		"<leader>cm",
		function()
			require("conform").format({
				lsp_fallback = true,
			})
		end,
		desc = "Format with Conform",
	},
})

-- ╭──────────────────────────────────────────────╮
-- │ DIAGNOSTICS                                  │
-- ╰──────────────────────────────────────────────╯

wk.add({
	{
		"<leader>df",
		vim.diagnostic.open_float,
		desc = "Show diagnostic",
	},

	{
		"<leader>dl",
		vim.diagnostic.setloclist,
		desc = "Location list",
	},

	{
		"<leader>dq",
		vim.diagnostic.setqflist,
		desc = "Quickfix list",
	},

	{
		"<leader>dd",
		function()
			vim.diagnostic.setloclist({
				open = true,
			})
		end,
		desc = "Diagnostics list",
	},

	{
		"<leader>dc",
		function()
			vim.diagnostic.reset()
		end,
		desc = "Clear diagnostics",
	},

	{
		"]d",
		function()
			vim.diagnostic.jump({
				count = 1,
			})
		end,
		desc = "Next diagnostic",
	},

	{
		"[d",
		function()
			vim.diagnostic.jump({
				count = -1,
			})
		end,
		desc = "Previous diagnostic",
	},

	{
		"]e",
		function()
			vim.diagnostic.jump({
				count = 1,
				severity = vim.diagnostic.severity.ERROR,
			})
		end,
		desc = "Next error",
	},

	{
		"[e",
		function()
			vim.diagnostic.jump({
				count = -1,
				severity = vim.diagnostic.severity.ERROR,
			})
		end,
		desc = "Previous error",
	},
})

-- ╭──────────────────────────────────────────────╮
-- │ TROUBLE                                      │
-- ╰──────────────────────────────────────────────╯

wk.add({
	{
		"<leader>xx",
		"<cmd>Trouble diagnostics toggle<cr>",
		desc = "Diagnostics",
	},

	{
		"<leader>xq",
		"<cmd>Trouble quickfix toggle<cr>",
		desc = "Quickfix",
	},

	{
		"<leader>xl",
		"<cmd>Trouble loclist toggle<cr>",
		desc = "Location list",
	},

	{
		"<leader>xs",
		"<cmd>Trouble symbols toggle<cr>",
		desc = "Symbols",
	},
})

-- ╭──────────────────────────────────────────────╮
-- │ GIT / GITSIGNS                               │
-- ╰──────────────────────────────────────────────╯

local gs = require("gitsigns")

wk.add({
	{
		"<leader>hs",
		gs.stage_hunk,
		desc = "Stage hunk",
	},

	{
		"<leader>hr",
		gs.reset_hunk,
		desc = "Reset hunk",
	},

	{
		"<leader>hS",
		gs.stage_buffer,
		desc = "Stage buffer",
	},

	{
		"<leader>hR",
		gs.reset_buffer,
		desc = "Reset buffer",
	},

	{
		"<leader>hp",
		gs.preview_hunk,
		desc = "Preview hunk",
	},

	{
		"<leader>hi",
		gs.preview_hunk_inline,
		desc = "Preview inline",
	},

	{
		"<leader>hb",
		function()
			gs.blame_line({
				full = true,
			})
		end,
		desc = "Blame line",
	},

	{
		"<leader>hd",
		gs.diffthis,
		desc = "Diff buffer",
	},

	{
		"<leader>hD",
		function()
			gs.diffthis("~")
		end,
		desc = "Diff against HEAD~",
	},

	{
		"<leader>hq",
		gs.setqflist,
		desc = "Send hunks to quickfix",
	},

	{
		"<leader>hQ",
		function()
			gs.setqflist("all")
		end,
		desc = "All hunks to quickfix",
	},

	{
		"<leader>tb",
		gs.toggle_current_line_blame,
		desc = "Toggle line blame",
	},

	{
		"<leader>tw",
		gs.toggle_word_diff,
		desc = "Toggle word diff",
	},

	{
		"]c",
		function()
			if vim.wo.diff then
				vim.cmd.normal({
					"]c",
					bang = true,
				})
			else
				gs.nav_hunk("next")
			end
		end,
		desc = "Next Git hunk",
	},

	{
		"[c",
		function()
			if vim.wo.diff then
				vim.cmd.normal({
					"[c",
					bang = true,
				})
			else
				gs.nav_hunk("prev")
			end
		end,
		desc = "Previous Git hunk",
	},
})

-- ╭──────────────────────────────────────────────╮
-- │ NOICE                                        │
-- ╰──────────────────────────────────────────────╯

wk.add({
	{
		"<leader>sn",
		function()
			require("noice").cmd("history")
		end,
		desc = "Message history",
	},

	{
		"<leader>sl",
		function()
			require("noice").cmd("last")
		end,
		desc = "Last message",
	},

	{
		"<leader>sd",
		function()
			require("noice").cmd("dismiss")
		end,
		desc = "Dismiss messages",
	},

	{
		"<leader>se",
		function()
			require("noice").cmd("errors")
		end,
		desc = "Errors",
	},

	{
		"<leader>st",
		function()
			require("noice").cmd("telescope")
		end,
		desc = "Noice Telescope",
	},
})

-- ╭──────────────────────────────────────────────╮
-- │ UI                                           │
-- ╰──────────────────────────────────────────────╯

wk.add({
	{
		"<leader>ua",
		"<cmd>AerialToggle!<cr>",
		desc = "Aerial symbols",
	},

	{
		"<leader>un",
		"<cmd>set number!<cr>",
		desc = "Toggle line numbers",
	},

	{
		"<leader>ur",
		"<cmd>set relativenumber!<cr>",
		desc = "Toggle relative numbers",
	},

	{
		"<leader>uw",
		"<cmd>set wrap!<cr>",
		desc = "Toggle wrap",
	},

	{
		"<leader>ui",
		"<cmd>IBLToggle<cr>",
		desc = "Toggle indent guides",
	},
})

-- ╭──────────────────────────────────────────────╮
-- │ WINDOWS                                      │
-- ╰──────────────────────────────────────────────╯

wk.add({
	{
		"<leader>wv",
		"<cmd>vsplit<cr>",
		desc = "Vertical split",
	},

	{
		"<leader>ws",
		"<cmd>split<cr>",
		desc = "Horizontal split",
	},

	{
		"<leader>wc",
		"<cmd>close<cr>",
		desc = "Close window",
	},

	{
		"<leader>wo",
		"<cmd>only<cr>",
		desc = "Only window",
	},

	{
		"<leader>wh",
		"<C-w>h",
		desc = "Move left",
	},

	{
		"<leader>wj",
		"<C-w>j",
		desc = "Move down",
	},

	{
		"<leader>wk",
		"<C-w>k",
		desc = "Move up",
	},

	{
		"<leader>wl",
		"<C-w>l",
		desc = "Move right",
	},

	{
		"<leader>w=",
		"<C-w>=",
		desc = "Equalize windows",
	},
})

-- ╭──────────────────────────────────────────────╮
-- │ QUIT                                         │
-- ╰──────────────────────────────────────────────╯

wk.add({
	{
		"<leader>qq",
		"<cmd>qa<cr>",
		desc = "Quit all",
	},

	{
		"<leader>qw",
		"<cmd>wqa<cr>",
		desc = "Save and quit",
	},

	{
		"<leader>qf",
		"<cmd>qa!<cr>",
		desc = "Force quit",
	},

	{
		"<leader>w",
		"<cmd>w<cr>",
		desc = "Save file",
	},
})
