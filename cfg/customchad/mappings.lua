local M = {}

M.truezen = {
  n = {
    ["<leader>ta"] = { "<cmd> TZAtaraxis <CR>", "  truezen ataraxis" },
    ["<leader>tf"] = { "<cmd> TZFocus <CR>", "  truezen focus" },
    ["<leader>tm"] = { "<cmd> TZMinimalist <CR>", "﫦 truezen minimalist" },
  },
}

M.tabufline = {

  n = {
    -- new buffer
    ["<S-b>"] = {},
    ["<S-t>"] = { "<cmd> enew <CR>", "烙 new buffer" },

    -- cycle through buffers
    ["<TAB>"] = { "<cmd> Tbufnext <CR>", "  goto next buffer" },
    ["<S-Tab>"] = { "<cmd> Tbufprev <CR> ", "  goto prev buffer" },

    -- cycle through tabs
    ["<leader>tp"] = {},
    ["<leader>tn"] = {},
    ["<S-l>"] = { "<cmd> tabnext <CR>", "  goto next tab" },
    ["<S-h>"] = { "<cmd> tabprevious <CR> ", "  goto prev tab" },

    -- close buffer + hide terminal buffer
    ["<leader>x"] = {
      function()
        require("core.utils").close_buffer()
      end,
      "   close buffer",
    },
  },
}

M.general = {

  n = {
    ["<C-q>"] = { "<C-w>q", "  close window" },
  },

  i = {
    ["<C-z>"] = { "<ESC>ciw", "undo in insert mode" },
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
