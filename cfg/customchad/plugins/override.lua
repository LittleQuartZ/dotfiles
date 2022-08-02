local M = {}

M.treesitter = {
  ensure_installed = {
    "lua",
    "html",
    "css",
    "javascript",
    "rasi",
    "cpp",
    "c",
    "toml",
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

M.nvimtree = {
  filters = {
    dotfiles = true,
  },
  create_in_closed_folder = true,
  respect_buf_cwd = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  git = {
    enable = true,
  },
  view = {
    hide_root_folder = false,
    mappings = {
      custom_only = false,
      list = {
        { key = { "l", "<CR>", "o" }, action = "edit" },
        { key = "h", action = "close_node" },
        { key = "v", action = "vsplit" },
      },
    },
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    indent_markers = {
      enable = true,
    },
  },
}

M.blankline = {
  char = "│",
  show_current_context = true,
  show_first_indent_level = true,
  context_pattern_highlight = {
    ["^func"] = "Function",
    ["^if"] = "Conditional",
  },
}

M.telescope = {
  extensions_list = {
    "themes",
    "terms",
    "projects",
  },
}

M.cmp = {
  formatting = {
    format = function(entry, vim_item)
      local icons = require("nvchad_ui.icons").lspkind
      if entry.source.name == "copilot" then
        vim_item.kind = "  Copilot"
        vim_item.kind_hl_group = "Copilot"
      else
        vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
      end
      return vim_item
    end,
  },
  sources = {
    { name = "luasnip", max_item_count = 10 },
    { name = "nvim_lsp", max_item_count = 15 },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "copilot" },
  },
}

M.comment = {
  pre_hook = function(ctx)
    local U = require "Comment.utils"

    local location = nil
    if ctx.ctype == U.ctype.block then
      location = require("ts_context_commentstring.utils").get_cursor_location()
    elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
      location = require("ts_context_commentstring.utils").get_visual_start_location()
    end

    return require("ts_context_commentstring.internal").calculate_commentstring {
      key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
      location = location,
    }
  end,
}

return M
