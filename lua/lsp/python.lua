local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local M = {
    init = function(on_attach, capabilities)
        lspconfig['pyright'].setup {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        typeChekingMode = 'strict',
                        diagnosticMode = 'workspace'
                    }
                }
            }
            -- root_dir = util.root_pattern(".git", "setup.py", "setup.cfg", "pyproject.toml", "requirements.txt")
        }
    end
}

return M
