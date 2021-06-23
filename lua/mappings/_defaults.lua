local U = require('utils')

U.map_global('i', 'jk', '<Esc>')
U.map_global('t', 'jk', '<C-\\><C-n>')
U.map_global('n', '<A-CR>', 'noh')
U.map_global('n', '<C-a>', 'ggVG')
U.map_global('n', '<C-h>', '<C-w>h')
U.map_global('n', '<C-j>', '<C-w>j')
U.map_global('n', '<C-k>', '<C-w>k')
U.map_global('n', '<C-l>', '<C-w>l')
U.map_global('n', 'J', 'mzJ`z')

U.run_lua('n', '<leader>w', 'require("utils").save_all()') -- K.normal('<C-s>', ':wa<CR>')
