local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,

M.options = {
   relativenumber = false,
}

-- example of changing theme:
M.ui = {
   italic_comments = true,
   theme = "catppuccin",
   transparency = true,
}

local userPlugins = require "custom.plugins" -- path to table

M.plugins = {

   install = userPlugins,

   status = {
      alpha = true,
      colorizer = true,
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig", -- or any path
      },
      statusline = {
         style = "arrow",
      },
   },
}

M.mappings = {

   -- misc = {
   --    close_buffer = "<leader>c",
   -- },

   plugins = {
      nvimtree = {
         toggle = "<C-n>",
         focus = "<leader>e",
      },
      lspconfig = {
         set_loclist = "<leader>l",
      },
   },
}

return M
