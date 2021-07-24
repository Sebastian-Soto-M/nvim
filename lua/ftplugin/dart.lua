local U = require('utils')
local D = require('mappings._dispatch')

local MOD = 'f'
local function chord(key) return '<leader>' .. MOD .. key end
U.run_lua('n', chord('h'), 'require("telescope").extensions.flutter.commands()')
U.run_vim('n', chord('r'), 'FlutterReload')
U.run_vim('n', chord('R'), 'FlutterRestart')
U.run_vim('n', chord('q'), 'FlutterQuit')
U.run_vim('n', chord('o'), 'FlutterOutline')
U.run_vim('n', chord('d'), 'FlutterDevices')
U.run_vim('n', '<leader>rr', 'FlutterRun')

