local K = require('modules.mappings._helper')
local T = require('modules.mappings._telescope')

K.insert('jk', '<Esc>')
K.normal('<A-CR>', 'noh')
K.normal('<C-a>', 'ggVG')
K.normal('<C-h>', '<C-w>h')
K.normal('<C-j>', '<C-w>j')
K.normal('<C-k>', '<C-w>k')
K.normal('<C-l>', '<C-w>l')
K.run_lua('<C-s>', 'require("utils").save_all()') -- K.normal('<C-s>', ':wa<CR>')
K.normal('J', 'mzJ`z')
K.term('jk', '<C-\\><C-n>')

-- SMALL PLUGIN DEFAULTS
K.run_lua('<leader>wh', 'require("hop").hint_words()')
K.run_lua('z=', T.telescope('spell_suggest'))
K.run_lua('q:', T.telescope('command_history'))
-- K.insert('n', '<C-w><C-o>', ':MaximizerToggle!<CR>')
-- K.insert('t', '<C-w><C-o>', '<C-\\><C-n> :MaximizerToggle!<CR>')
K.run_vim('<leader>sw', 'CtrlSF')
K.run_vim('<leader>ss', 'CtrlSF ', false)
