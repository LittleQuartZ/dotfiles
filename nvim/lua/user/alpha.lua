local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                                                                                              ]],
	[[                  __                                                        __                ]],
	[[   __      ___   /\_\     __     __  __        ___      __    ___   __  __ /\_\    ___ ___    ]],
	[[ /'__`\  /' _ `\ \/\ \  /'__`\  /\ \/\ \     /' _ `\  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\  ]],
	[[/\ \L\.\_/\ \/\ \ \ \ \/\ \L\.\_\ \ \_\ \    /\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[\ \__/.\_\ \_\ \_\_\ \ \ \__/.\_\\/`____ \   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[ \/__/\/_/\/_/\/_/\ \_\ \/__/\/_/ `/___/> \   \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	[[                 \ \____/            /\___/                                                   ]],
	[[                  \/___/             \/__/                                                    ]],
  [[                                                                                              ]]
}
dashboard.section.buttons.val = {
	dashboard.button("f", "  find file", ":Telescope find_files <CR>"),
	dashboard.button("e", "  new file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("p", "  find project", ":Telescope projects <CR>"),
	dashboard.button("r", "  recently used files", ":Telescope oldfiles <CR>"),
	dashboard.button("t", "  find text", ":Telescope live_grep <CR>"),
	dashboard.button("c", "  configuration", ":e ~/.config/nvim/init.lua <CR>"),
	dashboard.button("q", "  quit", ":qa<CR>"),
}

local function footer()
	-- NOTE: requires the fortune-mod package to work
	-- local handle = io.popen("fortune")
	-- local fortune = handle:read("*a")
	-- handle:close()
	-- return fortune
	return "littlequartz"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
