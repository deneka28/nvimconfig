local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- ASCII Art заголовок
dashboard.section.header.val = {
	[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
	[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
	[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
	[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
	[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
	[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
}

-- Кнопки меню
dashboard.section.buttons.val = {
	dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("g", "  Find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

-- Футер
local function footer()
	local datetime = os.date(" %d-%m-%Y   %H:%M:%S")
	local version = vim.version()
	local nvim_version_info = "   v" .. version.major .. "." .. version.minor .. "." .. version.patch
	return datetime .. "   " .. nvim_version_info
end

dashboard.section.footer.val = footer()

-- Применяем цвета
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"
dashboard.section.footer.opts.hl = "Type"

-- Настройка layout
dashboard.opts.layout[1].val = 8 -- отступ сверху

-- Запускаем
alpha.setup(dashboard.opts)

-- Убираем tabline и statusline на стартовой странице
vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	callback = function()
		vim.opt.showtabline = 0
		vim.opt.laststatus = 0
	end,
})

vim.api.nvim_create_autocmd("BufUnload", {
	buffer = 0,
	callback = function()
		vim.opt.showtabline = 2
		vim.opt.laststatus = 3
	end,
})
