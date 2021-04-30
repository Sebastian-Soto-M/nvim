local K = require('modules.mappings._helper')
local T = require('modules.mappings._telescope')
local buf_map = require('utils').buf_map
local buf_option = require('utils').buf_option

local function on_attach(client)
    buf_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    if type == 'jdtls' then
        K.run_lua_buf('n', 'ga', "require('jdtls').code_action()")
    else
        K.run_lua_buf('n', 'ga', T.telescope('lsp_code_actions'))
    end

    K.run_lua_buf('i', '<C-k>', 'vim.lsp.buf.signature_help()')

    buf_map('i', '<S-Tab>', "pumvisible() ? '<C-p>' : '<S-Tab>'",
            {expr = true, noremap = true})
    buf_map('i', '<Tab>', "pumvisible() ? '<C-n>' : '<Tab>'",
            {expr = true, noremap = true})

    K.run_lua_buf('n', '<leader>D', 'vim.lsp.buf.type_definition()')
    K.run_lua_buf('n', '<leader>d', 'vim.lsp.diagnostic.show_line_diagnostics({ show_header = false })')
    K.run_lua_buf('n', '<leader>k', 'vim.lsp.buf.signature_help()')
    K.run_lua_buf('n', '<leader>wa', 'vim.lsp.buf.add_workspace_folder()')
    K.run_lua_buf('n', '<leader>wl', 'print(vim.inspect(vim.lsp.buf.list_workspace_folders()))')
    K.run_lua_buf('n', '<leader>wr', 'vim.lsp.buf.remove_workspace_folder()')
    K.run_lua_buf('n', '<space>rn', 'vim.lsp.buf.rename()')
    K.run_lua_buf('n', 'K', 'vim.lsp.buf.hover()')
    K.run_lua_buf('n', '[d', 'vim.lsp.diagnostic.goto_prev()')
    K.run_lua_buf('n', ']d', 'vim.lsp.diagnostic.goto_next()')
    K.run_lua_buf('n', 'gD', 'vim.lsp.buf.declaration()')
    K.run_lua_buf('n', 'gd', 'vim.lsp.buf.definition()')
    K.run_lua_buf('n', 'gi', 'vim.lsp.buf.implementation()')
    K.run_lua_buf('n', '<leader>dd', T.telescope('lsp_document_diagnostics'))
    K.run_lua_buf('n', '<leader>ds', T.telescope('lsp_document_symbols'))
    K.run_lua_buf('n', '<leader>wd', T.telescope('lsp_workspace_diagnostics'))
    K.run_lua_buf('n', '<leader>ws', T.telescope('lsp_workspace_symbols'))
    K.run_lua_buf('n', 'gr', T.telescope('lsp_references'))
end

return on_attach
