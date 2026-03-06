local wk = require("which-key")

wk.setup({
	plugins = {
		marks = true, -- показывать маркеры
		registers = true, -- показывать регистры
		spelling = {
			enabled = true, -- z= для предложений исправления
			suggestions = 20,
		},
		presets = {
			operators = true, -- операторы типа d, y, c
			motions = true, -- движения типа w, b, e
			text_objects = true, -- text objects типа iw, aw
			windows = true, -- <C-w>
			nav = true, -- навигация
			z = true, -- команды с z
			g = true, -- команды с g
		},
	},
	-- Настройки popup окна
	win = {
		border = "rounded", -- "none", "single", "double", "rounded", "solid", "shadow"
		padding = { 1, 2 }, -- отступы
		title = true,
		title_pos = "center",
	},
	layout = {
		height = { min = 4, max = 25 }, -- высота окна
		width = { min = 20, max = 50 }, -- ширина
		spacing = 3, -- расстояние между колонками
		align = "left", -- "left", "center", "right"
	},
	-- Задержка перед показом
	delay = 300, -- ms

	-- Фильтр команд
	filter = function(mapping)
		return mapping.desc and mapping.desc ~= ""
	end,
})
wk.add({
	{ "<leader>f", group = "Telescope" },
	{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
	{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
	{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

	{ "<leader>d", group = "Diagnostics" },
	{ "<leader>df", vim.diagnostic.open_float, desc = "Show Float" },
	{ "<leader>dv", "<cmd>lua ...<cr>", desc = "Toggle Virtual Text" },
	{ "<leader>dl", vim.diagnostic.setloclist, desc = "Location List" },
	{ "<leader>dq", vim.diagnostic.setqflist, desc = "Quickfix List" },

	{ "]d", vim.diagnostic.goto_next, desc = "Next Diagnostic" },
	{ "[d", vim.diagnostic.goto_prev, desc = "Previous Diagnostic" },
	{ "]e", desc = "Next Error" },
	{ "[e", desc = "Previous Error" },

	--Conform
	{
		"<leader>fm",
		function()
			require("conform").format()
		end,
		desc = "Format Buffer",
	},
	--Noice
	{
		"<leader>sn",
		function()
			require("noice").cmd("history")
		end,
		desc = "Noice History",
	},
	{
		"<leader>sl",
		function()
			require("noice").cmd("last")
		end,
		desc = "Last Message",
	},
	{
		"<leader>sd",
		function()
			require("noice").cmd("dismiss")
		end,
		desc = "Dismiss All",
	},
})
