-- example file i.e lua/custom/init.lua

vim.opt.list = true
vim.opt.listchars:append "space:⋅"

vim.cmd [[highlight IndentBlanklineContextChar guifg=#DDB6F2 gui=nocombine]]

-- load your globals, autocmds here or anything .__.
