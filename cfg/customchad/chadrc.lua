-- Just an example, supposed to be placed in /lua/custom/

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
  theme = "catppuccin",
}

userPlugins = require "custom.plugins"

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  user = userPlugins,
  override = {
    ["nvim-treesitter/nvim-treesitter"] = {
      ensure_installed = {
        "html",
        "css",
        "javascript",
        "rasi",
        "cpp",
        "c",
        "toml",
      },
    },
    ["kyazdani42/nvim-tree.lua"] = {
      git = {
        enable = true,
      },
      view = {
        hide_root_folder = false,
      },
    },
  },
}

M.mappings = require "custom.mappings"

M.bufferline = {
  n = {
    ["<S-b>"] = "",
  },
}

return M
