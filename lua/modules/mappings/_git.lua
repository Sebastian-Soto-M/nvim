local K = require('modules.mappings._helper')

local MOD = '<leader>h'

local chord = function(key) return MOD .. key end
local gitSigns = function(cmd) return 'require("gitsigns").' .. cmd .. '()' end

local function gitSignsCommand(key, cmd) K.run_lua(chord(key), gitSigns(cmd)) end

K.run_lua(']c', gitSigns 'next_hunk')
K.run_lua('[c', gitSigns 'prev_hunk')

gitSignsCommand('s', 'stage_hunk')
gitSignsCommand('u', 'undo_stage_hunk')
gitSignsCommand('r', 'reset_hunk')
gitSignsCommand('R', 'reset_buffer')
gitSignsCommand('p', 'preview_hunk')
gitSignsCommand('b', 'blame_line')

K.run_vim(MOD .. 'g', 'Neogit')
