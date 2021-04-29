local K = require('modules.mappings._helper')
local T = require('plugins._telescope')

local MOD = '<leader>h'

local chord = function(key) return MOD .. key end
local gitSigns = function(cmd) return 'require("gitsigns").' .. cmd .. '()' end

local function gitSignsCommand(key, cmd) K.run_lua(chord(key), gitSigns(cmd)) end

K.run_lua(']c', gitSigns 'next_hunk')
K.run_lua('[c', gitSigns 'prev_hunk')

gitSignsCommand('R', 'reset_buffer')
gitSignsCommand('b', 'blame_line')
gitSignsCommand('b', 'git_branches')
gitSignsCommand('cb', 'git_bcommits')
gitSignsCommand('cc', 'git_commits')
gitSignsCommand('p', 'preview_hunk')
gitSignsCommand('r', 'reset_hunk')
gitSignsCommand('s', 'git_status')
gitSignsCommand('s', 'stage_hunk')
gitSignsCommand('u', 'undo_stage_hunk')

K.run_vim(MOD .. 'g', 'Neogit')