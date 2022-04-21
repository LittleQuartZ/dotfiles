return {
   { "elkowar/yuck.vim", ft = "yuck" },
   { "williamboman/nvim-lsp-installer" },
   {
      "jose-elias-alvarez/null-ls.nvim",
      after = "nvim-lspconfig",
      config = function()
         require("custom.plugins.null-ls").setup()
      end,
   },
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
