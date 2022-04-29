return {
  ["elkowar/yuck.vim"] = { ft = "yuck" },
  ["williamboman/nvim-lsp-installer"] = {
    after = "nvim-lspconfig",
    config = function()
      require("nvim-lsp-installer").setup()
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  ["lambdalisue/suda.vim"] = {},
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
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
  -- {
  --    "karb94/neoscroll.nvim",
  --    config = function()
  --       require("neoscroll").setup()
  --    end,
  --
  --    -- lazy loading
  --    setup = function()
  --       require("core.utils").packer_lazy_load "neoscroll.nvim"
  --    end,
  -- },
  -- { "xiyaowong/nvim-transparent" },
  -- { "ellisonleao/glow.nvim", cmd = "Glow" },
}
