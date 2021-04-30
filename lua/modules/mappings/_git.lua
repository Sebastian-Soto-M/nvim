local K = require('modules.mappings._helper')
local T = require('modules.mappings._telescope')

local MOD = '<leader>h'
local chord = function(key) return MOD .. key end

local G = {}

G.gitSigns = function(cmd) return 'require("gitsigns").' .. cmd .. '()' end

G.gitSignsCommand =
    function(key, cmd) K.run_lua(chord(key), G.gitSigns(cmd)) end

G.initialize_mappings = function()
    K.run_lua(']c', G.gitSigns 'next_hunk')
    K.run_lua('[c', G.gitSigns 'prev_hunk')
    G.gitSignsCommand('R', 'reset_buffer')
    G.gitSignsCommand('b', 'blame_line')
    G.gitSignsCommand('b', 'git_branches')
    G.gitSignsCommand('cb', 'git_bcommits')
    G.gitSignsCommand('cc', 'git_commits')
    G.gitSignsCommand('p', 'preview_hunk')
    G.gitSignsCommand('r', 'reset_hunk')
    G.gitSignsCommand('s', 'git_status')
    G.gitSignsCommand('S', 'stage_hunk')
    G.gitSignsCommand('u', 'undo_stage_hunk')

    K.run_vim(MOD .. 'g', 'Neogit')

    K.run_lua(chord('s'), T.telescope('git_status'))
    K.run_lua(chord('cb'), T.telescope('git_bcommits'))
    K.run_lua(chord('cc'), T.telescope('git_commits'))
    K.run_lua(chord('b'), T.telescope('git_branches'))
end

return G
