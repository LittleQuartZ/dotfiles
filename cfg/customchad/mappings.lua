local M = {}

M.truezen = {

  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "  truezen ataraxis" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "  truezen focus" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "﫦 truezen minimalist" },
  },
}

M.bufferline = {

  n = {
    ["<S-l>"] = { "<cmd>tabnext <CR>", "  cycle next tab" },
    ["<S-h>"] = { "<cmd>tabprev <CR>", "  cycle prev tab" },

    ["<S-t>"] = { "<cmd> enew <CR>", "烙 new buffer" },
  },
}

M.general = {

  n = {
    ["<C-q>"] = { "<C-w>q", "  close window" },
  },

  },
}

M.telescope = {

  n = {
    ["<leader>fk"] = { "<cmd> Telescope keymaps <CR>", "  show keys" },
    ["<leader>fp"] = { "<cmd> Telescope keymaps <CR>", "  projects" },
    ["<leader>fs"] = { "<cmd>SessionManager load_session<CR>", "  sessions" },

    ["<leader>fgc"] = { "<cmd> Telescope git_commits <CR>", "  git commits" },
    ["<leader>fgs"] = { "<cmd> Telescope git_status <CR>", "  git status" },
    ["<leader>fgb"] = { "<cmd> Telescope git_branch <CR>", "  git branch" },

    ["<leader>ft"] = { "<cmd> Telescope terms <CR>", "  pick hidden term" },
  },
}

M.lspconfig = {

  n = {

    -- ["<leader>ra"] = {
    --   "<cmd>Lspsaga rename<CR>",
    --   "   lsp rename",
    -- },

    ["<leader>ca"] = {
      "<cmd>Lspsaga code_action<CR>",
      "  lsp code_action",
    },

    ["<leader>f"] = {
      "<cmd>Lspsaga show_cursor_diagnostics<CR>",
      "  floating diagnostic",
    },

    ["[d"] = {
      "<cmd>Lspsaga diagnostic_jump_prev<CR>",
      "  prev diagnostic",
    },

    ["]d"] = {
      "<cmd>Lspsaga diagnostic_jump_next<CR>",
      "  next diagnostic",
    },

    ["gr"] = {
      "<cmd>Telescope lsp_references<CR>",
      "  lsp references",
    },
  },
}

M.rest = {
  n = {
    ["<leader>rs"] = {
      "<Plug>RestNvim",
      "send request behind the cursor",
    },
    ["<leader>rl"] = {
      "<Plug>RestNvimLast",
      "send last request",
    },
  },
}

-- M.leap = {
--   n = {
--     ["s"] = { "<Plug>(leap-forward)", "Leap forward" },
--     ["S"] = { "<Plug>(leap-backward)", "Leap backward" },
--   },
--
--   v = {
--     ["s"] = { "<Plug>(leap-forward)", "Leap forward" },
--     ["S"] = { "<Plug>(leap-backward)", "Leap backward" },
--   },
--
--   o = {
--     ["z"] = { "<Plug>(leap-forward-x)", "Leap forward-x" },
--     ["Z"] = { "<Plug>(leap-backward-x)", "Leap backward-x" },
--   },
-- }

return M
