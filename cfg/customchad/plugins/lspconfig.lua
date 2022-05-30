local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- lspservers with default config
  local servers = { "html", "cssls", "clangd", "emmet_ls", "tailwindcss", "tsserver", "lemminx" }

  for _, lsp in ipairs(servers) do
    if lsp == "emmet_ls" then
      lspconfig[lsp].setup {
        on_attach = attach,
        capabilities = capabilities,
        filetypes = { "html", "css", "javascriptreact", "javascript.jsx" },
      }
    end

    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
    }
  end
end

return M
