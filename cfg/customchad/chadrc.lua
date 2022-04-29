local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
  user = function()
    vim.opt.scrolloff = 8
    vim.opt.showmode = false
    vim.g.did_load_filetypes = 1
  end,
}

M.ui = {
  theme = "everforest",
}

userPlugins = require "custom.plugins"

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig", -- path of lspconfig file
    },
    statusline = {
      style = "block", -- default/round/slant/block/arrow
    },
  },
  user = userPlugins,
}

return M
