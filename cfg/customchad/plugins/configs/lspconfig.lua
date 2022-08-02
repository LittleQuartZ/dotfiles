local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "emmet_ls", "tailwindcss", "tsserver", "lemminx" }

for _, lsp in ipairs(servers) do
  if lsp == "emmet_ls" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "html", "css", "javascriptreact", "javascript.jsx" },
    }
  elseif lsp == "tsserver" then
    lspconfig[lsp].setup {
      handlers = {
        ["textDocument/publishDiagnostics"] = function() end,
      },
      on_attach = on_attach,
      capabilities = capabilities,
    }
  else
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end
