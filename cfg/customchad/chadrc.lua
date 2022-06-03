-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.options = {
  user = function()
    vim.opt.scrolloff = 8
    vim.opt.showmode = false

    vim.opt.list = true
    vim.opt.listchars:append "space:⋅"
  end,
}

M.ui = {
  hl_override = {
    IndentBlanklineContextChar = {
      fg = "purple",
      bg = "black",
    },
    -- rainbowcol1 = { fg = "red" },
    -- rainbowcol2 = { fg = "teal" },
    -- rainbowcol3 = { fg = "yellow" },
    -- rainbowcol4 = { fg = "blue" },
    -- rainbowcol5 = { fg = "pink" },
    -- rainbowcol6 = { fg = "orange" },
    -- rainbowcol7 = { fg = "white" },
  },

  theme = "catppuccin",
  transparency = true,
}

userPlugins = require "custom.plugins"
override = require "custom.plugins.override"

M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
    statusline = {
      separator_style = "block", -- default/round/slant/block/arrow
    },
  },
  user = userPlugins,
  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
    ["nvim-telescope/telescope.nvim"] = override.telescope,
    ["hrsh7th/nvim-cmp"] = override.cmp,
  },
}

M.mappings = require "custom.mappings"

M.bufferline = {
  n = {
    ["<S-b>"] = "",
  },
}

return M
