local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,

M.options = {
  relativenumber = true,
}

-- example of changing theme:
M.ui = {
   theme = "catppuccin",
}

local userPlugins = require "custom.plugins" -- path to table

M.plugins = {

   install = userPlugins,

   status = {
     alpha = true
   },

  options = {
     lspconfig = {
       setup_lspconf = "custom.plugins.lspconfig", -- or any path
     }
  }
}

M.mappings = {

   -- misc = {
   --    close_buffer = "<leader>c",
   -- },

   plugins = {
     nvimtree = {
        toggle = "<C-b>",
     },
   }
}

return M
