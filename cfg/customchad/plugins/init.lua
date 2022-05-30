return {
  ["elkowar/yuck.vim"] = {
    opt = true,
    ft = "yuck",
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  ["lambdalisue/suda.vim"] = { cmd = { "SudaRead", "SudaWrite" } },
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
  ["nathom/filetype.nvim"] = {}, -- not lazyloaded
  ["turbio/bracey.vim"] = { cmd = { "Bracey", "BraceyEval", "BraceyStop", "BraceyReload" } },
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "custom.plugins.alpha"
    end,
  },
  ["fladson/vim-kitty"] = {
    opt = true,
    ft = "kitty",
  },
  ["dsznajder/vscode-es7-javascript-react-snippets"] = {
    run = "yarn install --frozen-lockfile && yarn compile",
    event = "InsertEnter",
  },
  ["stevearc/dressing.nvim"] = {
    event = "BufRead",
  },
  ["JoosepAlviste/nvim-ts-context-commentstring"] = { ft = { "javascriptreact", "typescriptreact" } },
  ["https://github.com/windwp/nvim-ts-autotag"] = {
    before = "nvim-treesitter",
    opt = true,
    ft = {
      "html",
      "javascript",
      "typescript",
      "javascriptreact",
      "typescriptreact",
      "svelte",
      "vue",
      "tsx",
      "jsx",
      "rescript",
      "xml",
      "php",
      "markdown",
      "glimmer",
      "handlebars",
      "hbs",
    },
  },
  ["ahmedkhalf/project.nvim"] = {
    event = "BufRead",
    ft = "alpha",
    config = function()
      require("project_nvim").setup()
    end,
  },
  ["ggandor/leap.nvim"] = {
    event = "BufRead",
    config = function()
      require("leap").set_default_keymaps()
    end,
  },
  ["Shatur/neovim-session-manager"] = {
    cmd = "SessionManager",
    event = "BufRead",
    config = function()
      local Path = require "plenary.path"
      require("session_manager").setup {
        sessions_dir = Path:new(vim.fn.stdpath "data", "sessions"),
        path_replacer = "__",
        colon_replacer = "++",
        autoload_mode = require("session_manager.config").AutoloadMode.Disabled,
        autosave_last_session = true,
        autosave_ignore_not_normal = true,
        autosave_ignore_filetypes = {
          "gitcommit",
        },
        autosave_only_in_session = true,
        max_path_length = 80,
      }
    end,
  },
  ["tami5/lspsaga.nvim"] = {
    after = "nvim-lspconfig",
    cmd = "LspSaga",
    config = function()
      require("lspsaga").setup {
        finder_action_keys = {
          open = "l",
          vsplit = "s",
          split = "i",
          quit = "q",
          scroll_down = "<C-f>",
          scroll_up = "<C-b>",
        },
        code_action_keys = {
          quit = "q",
          exec = "l",
        },
        rename_action_keys = {
          quit = "<C-c>",
          exec = "<CR>",
        },
      }
    end,
  },
}
