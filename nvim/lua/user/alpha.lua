local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
	[[                                                                   ]],
	[[                                                 __                ]],
	[[                    ___      __    ___   __  __ /\_\    ___ ___    ]],
	[[    /| ､          /' _ `\  /'__`\ / __`\/\ \/\ \\/\ \ /' __` __`\  ]],
	[[   (°､ ｡ 7        /\ \/\ \/\  __//\ \L\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
	[[    |､  ~ヽ       \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
	[[    じしf_,)〳     \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
	[[                                                                   ]],
	[[                                                                   ]],
  [[                                                                   ]]
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
