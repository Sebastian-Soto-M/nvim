local nvim_lsp = require('lspconfig')
local I = require('theme.icons')
local U = require('utils')
local T = require('mappings._telescope')
local lsp = vim.lsp
local fn = vim.fn

lsp.handlers["textDocument/publishDiagnostics"] =
    lsp.with(lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = {prefix = I.diagnostics.prefix, spacing = 4}
    })
fn.sign_define("LspDiagnosticsSignError", {
    text = I.diagnostics.error,
    numhl = "LspDiagnosticsDefaultError"
})
fn.sign_define("LspDiagnosticsSignWarning", {
    text = I.diagnostics.warning,
    numhl = "LspDiagnosticsDefaultWarning"
})
fn.sign_define("LspDiagnosticsSignInformation", {
    text = I.diagnostics.info,
    numhl = "LspDiagnosticsDefaultInformation"
})
fn.sign_define("LspDiagnosticsSignHint",
               {text = I.diagnostics.hint, numhl = "LspDiagnosticsDefaultHint"})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    U.run_lua('n', 'gD', 'vim.lsp.buf.declaration()')
    T.lsp.definitions('gd') -- U.run_lua('n', 'gd', 'vim.lsp.buf.definition()') -- go to definition
    U.run_lua('n', 'K', 'vim.lsp.buf.hover()')
    U.run_lua('n', 'gi', 'vim.lsp.buf.implementation()')
    U.run_lua('n', '<leader>k', 'vim.lsp.buf.signature_help()')
    U.run_lua('n', '<leader>wa', 'vim.lsp.buf.add_workspace_folder()')
    U.run_lua('n', '<leader>wr', 'vim.lsp.buf.remove_workspace_folder()')
    U.run_lua('n', '<leader>wl',
              'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))')
    U.run_lua('n', '<leader>D', 'vim.lsp.buf.type_definition()')
    U.run_lua('n', '<space>rn', 'vim.lsp.buf.rename()')
    U.run_lua('n', 'ga', 'vim.lsp.buf.code_action()')
    T.lsp.references('gr')
    U.run_lua('n', '<leader>d',
              'vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })')
    U.run_lua('n', '[d', 'vim.lsp.diagnostic.goto_prev()')
    U.run_lua('n', ']d', 'vim.lsp.diagnostic.goto_next()')
    T.lsp.document_diagnostics('<leader>dd')
    T.lsp.document_symbols('<leader>ds')
    T.lsp.workspace_diagnostics('<leader>wd')
    T.lsp.workspace_symbols('<leader>ws')

end

-- require('lsp.angularls')
-- require('lsp.bash')
-- require('lsp.css')
-- require('lsp.efm')
-- require('lsp.html')
-- require('lsp.json')
-- require('lsp.lua')
require('lsp.python').init(on_attach, capabilities)
-- require('lsp.ts')
-- require('lsp.vim')
-- require('lsp.rust')
-- require('lsp.sql')
