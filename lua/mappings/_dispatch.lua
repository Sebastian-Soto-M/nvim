local U = require('utils')
local D = {}
local function dfun(keys, comp, cmd, mode)
    cmd = table.concat({comp, cmd}, ' ')
    if mode == nil then mode = 'Start' end
    U.run_vim('n', keys, table.concat(
                  {'let b:dispatch = "', cmd, '"', '<bar>', mode, cmd}, ' '))
end
D = {
    MOD = 'r',
    chord = function(key) return '<leader>' .. D.MOD .. key end,
    dispatch = function(keys) U.run_vim('n', keys, 'Dispatch') end,
    start = {
        run = function(keys, comp) dfun(keys, comp, 'run') end,
        test = function(keys, comp) dfun(keys, comp, 'test') end
    },
    clean = function(keys, comp) dfun(keys, comp, 'clean', 'Dispatch') end,
    reset = function(keys) U.run_vim('n', keys, 'Focus!') end
}

D.initialize_mappings = function(comp)
    D.start.run(D.chord('r'), comp)
    D.start.test(D.chord('t'), comp)
    D.clean(D.chord('c'), comp)
    D.reset(D.chord('R'))
    D.dispatch(D.chord('l'))
end
return D
