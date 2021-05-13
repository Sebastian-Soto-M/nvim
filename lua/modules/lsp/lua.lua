local on_attach = require('modules.lsp.on_attach')

require('nlua.lsp.nvim').setup(require('lspconfig'), {
    on_attach = on_attach,
    globals = {'vim', 'use', 'bufnr'}
})
