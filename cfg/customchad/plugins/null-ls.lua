local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },

  b.formatting.eslint_d,
  b.diagnostics.eslint_d,

  b.formatting.xmllint,
  -- b.diagnostics.codespell,

  -- Lua
  b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--global vim" } },

  -- Shell
  b.formatting.shfmt.with { extra_args = { "-i", "2", "-ci" } },
  b.code_actions.shellcheck,
  b.diagnostics.shellcheck,
}

local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,

    -- format on save
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      end
    end,
  }
end

return M
