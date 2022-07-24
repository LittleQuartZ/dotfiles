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
    elseif lsp == "tsserver" then
      lspconfig[lsp].setup {
        handlers = {
          ["textDocument/publishDiagnostics"] = function() end,
        },
        on_attach = attach,
        capabilities = capabilities,
      }
    else
      lspconfig[lsp].setup {
        on_attach = attach,
        capabilities = capabilities,
      }
    end
  end
end

return M
