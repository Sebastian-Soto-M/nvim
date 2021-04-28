local lsp_config = require('lspconfig')
local on_attach = require('modules.lsp.on_attach')

lsp_config.angularls.setup{}

lsp_config.tsserver.setup({
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
})
