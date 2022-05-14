return {
  ["elkowar/yuck.vim"] = { ft = "yuck" },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  ["lambdalisue/suda.vim"] = {},
  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require("custom.plugins.truezen").setup()
    end,
  },
  ["nathom/filetype.nvim"] = {},
  ["turbio/bracey.vim"] = {},
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },
  ["fladson/vim-kitty"] = {
    ft = "kitty",
  },
}
