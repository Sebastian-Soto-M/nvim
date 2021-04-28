local lsp_config = require('lspconfig')
local on_attach = require('modules.lsp.on_attach')

lsp_config.vimls.setup({
  on_attach = on_attach
})
