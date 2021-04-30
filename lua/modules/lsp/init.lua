local lsp_config = require("lspconfig")
local lsp = vim.lsp
local fn = vim.fn

lsp.handlers["textDocument/publishDiagnostics"] = lsp.with(
  lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      prefix = "●",
      spacing = 4,
    }
  }
)

fn.sign_define("LspDiagnosticsSignError", { text = "🞮", numhl = "LspDiagnosticsDefaultError" })
fn.sign_define("LspDiagnosticsSignWarning", { text = "▲", numhl = "LspDiagnosticsDefaultWarning" })
fn.sign_define("LspDiagnosticsSignInformation", { text = "⁈", numhl = "LspDiagnosticsDefaultInformation" })
fn.sign_define("LspDiagnosticsSignHint", { text = "⯁", numhl = "LspDiagnosticsDefaultHint" })

require('modules.lsp.angularls')
require('modules.lsp.bash')
require('modules.lsp.css')
require('modules.lsp.efm')
-- require('modules.lsp.html')
require('modules.lsp.json')
require('modules.lsp.lua')
require('modules.lsp.python')
require('modules.lsp.rust')
require('modules.lsp.sql')
require('modules.lsp.ts')
require('modules.lsp.vim')
