-- example file i.e lua/custom/init.lua

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<leader>za", ":TZAtaraxis <CR>")
map("n", "<leader>zm", ":TZMinimalist <CR>")

-- require("my autocmds file") or just declare them here
