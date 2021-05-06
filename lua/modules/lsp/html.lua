local lsp_config = require('lspconfig')
local on_attach = require('modules.lsp.on_attach')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp_config.html.setup({
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end,
    capabilities = capabilities,
    filetypes = {"html", "jinja"}
})
