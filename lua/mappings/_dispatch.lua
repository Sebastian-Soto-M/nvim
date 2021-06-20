local U = require('utils')
local D = {}
D = {
    MOD = 'f',
    chord = function(key) return '<leader>' .. D.MOD .. key end,
    ft = '',
    cmd = '',
    dispatch = function(cmd)
        return 'require("plugins._dispatch").' .. cmd .. '(' .. D.ft .. ', ' ..
                   D.cmd .. ')'
    end,
    start = {
        run = function(keys)
            U.run_lua('n', keys, D.dispatch('find_files'))
        end,
        test = function(keys)
            U.run_lua('n', keys, D.dispatch('frecency'))
        end
    },
    reset = function(keys) U.run_lua('n', keys, D.dispatch('reset')) end
}
D.set_dispatch = function(ftplugin, cmd)
    D.ft = ftplugin
    D.cmd = cmd
end

D.initialize_mappings = function()
    D.start.run(D.chord('r'))
    D.start.test(D.chord('t'))
    D.reset(D.chord('R'))
end
return D
