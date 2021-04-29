local K = require('modules.mappings._helper')

local MOD = '<leader>f'
local chord = function(key) return MOD .. key end

local T = {}

T.telescope = function(cmd)
    return 'require("plugins._telescope").' .. cmd .. '()'
end

T.telescopeCommand =
    function(key, cmd) K.run_lua(chord(key), T.telescope(cmd)) end

T.telescopeCommand('b', 'buffers')
T.telescopeCommand('c', 'commands')
T.telescopeCommand('f', 'find_files')
T.telescopeCommand('r', 'frecency')
T.telescopeCommand('h', 'help_tags')
T.telescopeCommand('k', 'keymaps')
T.telescopeCommand('g', 'live_grep')
T.telescopeCommand('ga', 'lsp_code_actions')
T.telescopeCommand('dd', 'lsp_document_diagnostics')
T.telescopeCommand('ds', 'lsp_document_symbols')
T.telescopeCommand('gr', 'lsp_references')
T.telescopeCommand('wd', 'lsp_workspace_diagnostics')
T.telescopeCommand('ws', 'lsp_workspace_symbols')
T.telescopeCommand('m', 'marks')
T.telescopeCommand('S', 'registers')
T.telescopeCommand('R', 'reloader')
T.telescopeCommand('s', 'search_history')
T.telescopeCommand('t', 'tags')

return T