local U = require('utils')
local D = {}

local function save_wrapper(cmd) return 'wa' .. cmd end

local function dfun(keys, comp, cmd, mode)
    cmd = table.concat({comp, cmd}, ' ')
    if mode == nil then mode = 'Start' end
    U.run_vim('n', keys, save_wrapper(table.concat(
                                          {
            '<bar>', 'let b:dispatch = "', cmd, '"', '<bar>', mode, cmd
        }, ' ')))
end
D = {
    MOD = 'r',
    chord = function(key) return '<leader>' .. D.MOD .. key end,
    dispatch = function(keys)
        U.run_vim('n', keys,
                  save_wrapper(table.concat({'<bar>', 'Dispatch'}, ' ')))
    end,
    start = {
        install = function(keys, comp) dfun(keys, comp, 'install') end,
        uninstall = function(keys, comp) dfun(keys, comp, 'uninstall') end,
        run = function(keys, comp) dfun(keys, comp, 'run') end,
        test = function(keys, comp) dfun(keys, comp, 'test') end
    },
    clean = function(keys, comp) dfun(keys, comp, 'clean', 'Dispatch') end,
    reset = function(keys)
        U.run_vim('n', keys,
                  save_wrapper(table.concat({'<bar>', 'Focus!'}, ' ')))
    end,
    run_file = function(keys, comp) dfun(keys, comp, '%', 'Dispatch') end
}

D.initialize_mappings = function(comp)
    D.start.run(D.chord('r'), comp)
    D.start.test(D.chord('t'), comp)
    D.start.install(D.chord('i'), comp)
    D.start.uninstall(D.chord('u'), comp)
    D.clean(D.chord('c'), comp)
    D.reset(D.chord('R'))
    D.dispatch(D.chord('l'))
end

D.map_run_file = function(comp) D.run_file(D.chord('f'), comp) end

return D
