local K = require('modules.mappings._helper')
local T = require('modules.mappings._telescope')

local G = {}

G = {
    MOD = 'h',
    chord = function(key) return '<leader>' .. G.MOD .. key end,
    gitSigns = function(cmd) return 'require("gitsigns").' .. cmd .. '()' end,

    blame_line = function(keys) K.run_lua(keys, G.gitSigns('blame_line')) end,
    dashboard = function(keys) K.run_vim(keys, 'Neogit') end,
    diff = function(keys) K.run_vim(keys, 'Gdiff') end,
    hunk = {
        next = function(keys) K.run_lua(keys, G.gitSigns('next_hunk')) end,
        prev = function(keys) K.run_lua(keys, G.gitSigns('prev_hunk')) end,
        preview = function(keys)
            K.run_lua(keys, G.gitSigns('preview_hunk'))
        end,
        reset = function(keys) K.run_lua(keys, G.gitSigns('reset_hunk')) end,
        stage = function(keys) K.run_lua(keys, G.gitSigns('stage_hunk')) end,
        undo = function(keys) K.run_lua(keys, G.gitSigns('undo_hunk')) end
    },
    reset_buffer = function(keys) K.run_lua(keys, G.gitSigns('reset_buffer')) end
}

G.initialize_mappings = function()
    G.blame_line(G.chord('B'))
    G.dashboard(G.chord('g'))
    G.diff(G.chord('d'))
    G.hunk.next(']c')
    G.hunk.prev('[c')
    G.hunk.preview(G.chord('p'))
    G.hunk.reset(G.chord('r'))
    G.hunk.stage(G.chord('S'))
    G.hunk.undo(G.chord('u'))
    G.reset_buffer(G.chord('R'))
    T.git.bcommits(G.chord('cb'))
    T.git.branches(G.chord('b'))
    T.git.commits(G.chord('cc'))
    T.git.status(G.chord('s'))
end

return G
