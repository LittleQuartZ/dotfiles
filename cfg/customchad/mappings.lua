local M = {}

M.truezen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "  truezen ataraxis" },
    ["<leader>tf"] = { "<cmd> TZAtaraxis <CR>", "  truezen focus" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "﫦 truezen minimalist" },
  },
}

M.bufferline = {
  n = {
    ["<S-t>"] = { "<cmd> enew <CR>", "烙 new buffer" },
  },
}

return M
