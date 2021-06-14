local lspconfig = require('lspconfig')
local util = require('lspconfig/util')
local on_attach = require('modules.lsp.on_attach')

lspconfig.pyright.setup {
    on_attach = on_attach,
    filetypes = {"python"},
    root_dir = util.root_pattern(".git", "setup.py", "setup.cfg",
                                 "pyproject.toml", "requirements.txt"),
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                typeChekingMode = "off"
            }
        }
    }
}

