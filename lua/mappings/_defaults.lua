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
U.map_global('n', '[t', 'tabp')
U.map_global('n', ']t', 'tabn')

U.run_lua('n', '<leader>w', 'require("utils").save_all()') -- K.normal('<C-s>', ':wa<CR>')

-- Date insertion
U.map_global('i', '<Leader>ymd', '<C-R>=strftime("%y%m%d")<CR>')
U.map_global('i', '<Leader>mdy', '<C-R>=strftime("%m/%d/%y")<CR>')
U.map_global('i', '<Leader>ndy', '<C-R>=strftime("%b %d, %Y")<CR>')
U.map_global('i', '<Leader>hms', '<C-R>=strftime("%T")<CR>')
U.map_global('i', '<Leader>ynd', '<C-R>=strftime("%Y %b %d")<CR>')
