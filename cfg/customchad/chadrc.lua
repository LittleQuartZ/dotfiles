local override = require "custom.plugins.override"
local M = {}

-- ref: core/default_config.lua

M.ui = {
  hl_override = {
    IndentBlanklineContextChar = {
      fg = "purple",
    },
    Comment = {
      fg = "grey_fg",
      italic = true,
    },
  },

  hl_add = {
    Copilot = {
      fg = "yellow",
    },
  },

  theme = "rxyhn",
  transparency = true,
}

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["nvim-treesitter/nvim-treesitter"] = override.treesitter,
    ["kyazdani42/nvim-tree.lua"] = override.nvimtree,
    ["lukas-reineke/indent-blankline.nvim"] = override.blankline,
    ["nvim-telescope/telescope.nvim"] = override.telescope,
    ["hrsh7th/nvim-cmp"] = override.cmp,
    ["numToStr/Comment.nvim"] = override.comment,
  },
}

M.mappings = require "custom.mappings"

return M
