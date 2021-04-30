local K = require('modules.mappings._helper')

local MOD = '<leader>f'
local chord = function(key) return MOD .. key end

local T = {}

T.telescope = function(cmd)
    return 'require("plugins._telescope").' .. cmd .. '()'
end

T.telescopeCommand =
    function(key, cmd) K.run_lua(chord(key), T.telescope(cmd)) end

T.initialize_mappings = function()
    T.telescopeCommand('R', 'reloader')
    T.telescopeCommand('S', 'registers')
    T.telescopeCommand('b', 'buffers')
    T.telescopeCommand('c', 'commands')
    T.telescopeCommand('f', 'find_files')
    T.telescopeCommand('g', 'live_grep')
    T.telescopeCommand('h', 'help_tags')
    T.telescopeCommand('k', 'keymaps')
    T.telescopeCommand('m', 'marks')
    T.telescopeCommand('o', 'vim_options')
    T.telescopeCommand('r', 'frecency')
    T.telescopeCommand('s', 'search_history')
    T.telescopeCommand('t', 'tags')
end

T.lsp = {
    code_actions = function(keys)
        K.run_lua_buf('n', keys, T.telescope('lsp_code_actions'))
    end,
    document_diagnostics = function(keys)
        K.run_lua_buf('n', keys, T.telescope('lsp_document_diagnostics'))
    end,
    document_symbols = function(keys)
        K.run_lua_buf('n', keys, T.telescope('lsp_document_symbols'))
    end,
    workspace_diagnostics = function(keys)
        K.run_lua_buf('n', keys, T.telescope('lsp_workspace_diagnostics'))
    end,
    workspace_symbols = function(keys)
        K.run_lua_buf('n', keys, T.telescope('lsp_workspace_symbols'))
    end,
    references = function(keys)
        K.run_lua_buf('n', keys, T.telescope('lsp_references'))
    end
}

return T
