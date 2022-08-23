-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

require('lspconfig').csharp_ls.setup({
  on_attach = require('lsp.utils').on_attach,
  capabilities = capabilities,
})