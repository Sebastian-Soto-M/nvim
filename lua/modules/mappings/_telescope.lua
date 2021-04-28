local K = require('modules.mappings._helper')

local MOD = '<leader>f'

local chord = function(key) return MOD .. key end
local telescope = function(cmd) return 'require("telescope.builtin").' .. cmd .. '()' end-- 

local function telescopeCommand(key, cmd) K.run_lua(chord(key), telescope(cmd)) end

telescopeCommand('f', 'find_files')
telescopeCommand('g', 'live_grep')
telescopeCommand('t', 'help_tags')
telescopeCommand('b', 'buffers')
K.run_lua(chord('r'), "require('telescope').extensions.frecency.frecency()")