local I = require('modules.theme.icons')
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

require('modules.lsp.angularls')
require('modules.lsp.bash')
require('modules.lsp.css')
-- require('modules.lsp.efm')
require('modules.lsp.html')
require('modules.lsp.json')
require('modules.lsp.lua')
require('modules.lsp.python')
require('modules.lsp.ts')
require('modules.lsp.vim')
-- require('modules.lsp.rust')
-- require('modules.lsp.sql')
