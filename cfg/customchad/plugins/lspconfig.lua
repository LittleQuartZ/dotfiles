local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- lspservers with default config
  local servers = { "html", "cssls", "clangd", "emmet_ls", "eslint", "tailwindcss" }

  for _, lsp in ipairs(servers) do
    if lsp == "emmet_ls" then
      filetypes = { "html", "css", "javascriptreact" }
    end

    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
      filetypes = filetypes,
    }
  end
end

return M
