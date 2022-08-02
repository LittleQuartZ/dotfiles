return {

  -- TEMP FIX
  ["NvChad/ui"] = {
    after = "base46",
    commit = "6d18c5482b30bbcb02ac20049f2b0b67be9ea164",
    config = function()
      require("plugins.configs.others").nvchad_ui()
    end,
  },

  -- Languages Options
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.lspconfig"
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.configs.null-ls").setup()
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
  ["williamboman/mason.nvim"] = {
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",
      "luacheck",

      -- web dev
      "css-lsp",
      "html-lsp",
      "typescript-language-server",
      "prettierd",
      "emmet-ls",
      "json-lsp",
      "tailwindcss-language-server",

      "lemminx",
    },
  },

  ["elkowar/yuck.vim"] = {
    opt = true,
    ft = "yuck",
  },
  ["lambdalisue/suda.vim"] = { cmd = { "SudaRead", "SudaWrite" } },
  ["Pocco81/TrueZen.nvim"] = {
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZFocus",
    },
    config = function()
      require("true-zen").setup {
        modes = {
          ataraxis = {
            shade = "dark",
            backdrop = 0,
            minimum_writing_area = {
              width = 70,
              height = 60,
            },
            quit_untoggles = true,
            padding = {
              left = 52,
              right = 52,
              top = 0,
              bottom = 0,
            },
            open_callback = nil,
            close_callback = nil,
          },
          minimalist = {
            ignored_buf_types = { "nofile" },
            options = {
              number = false,
              relativenumber = false,
              showtabline = 0,
              signcolumn = "no",
              statusline = "",
              cmdheight = 1,
              laststatus = 0,
              showcmd = false,
              showmode = false,
              ruler = false,
              numberwidth = 1,
            },
            open_callback = nil,
            close_callback = nil,
          },
          narrow = {

            folds_style = "informative",
            run_ataraxis = true,
            open_callback = nil,
            close_callback = nil,
          },
          focus = {
            open_callback = nil,
            close_callback = nil,
          },
        },
        integrations = {
          tmux = false,
          kitty = {
            enabled = false,
            font = "+3",
          },
          twilight = false,
        },
      }
    end,
  },

  -- Dashboard
  ["goolord/alpha-nvim"] = {
    disable = false,
    config = function()
      require "custom.plugins.configs.alpha"
    end,
  },

  -- Web Dev
  ["JoosepAlviste/nvim-ts-context-commentstring"] = {},
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

  -- Copilot
  -- ["github/copilot.vim"] = {},
  ["zbirenbaum/copilot.lua"] = {
    event = { "VimEnter" },
    config = function()
      -- vim.schedule(function()
      --   require("copilot").setup()
      -- end)
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end,
  },
  ["zbirenbaum/copilot-cmp"] = {
    after = { "copilot.lua" },
    before = { "nvim-cmp" },
  },

  ["NTBBloodbath/rest.nvim"] = {
    -- ft = "http",
    config = function()
      require("rest-nvim").setup {
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          show_http_info = true,
          show_headers = true,
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
      }
    end,
  },
}
