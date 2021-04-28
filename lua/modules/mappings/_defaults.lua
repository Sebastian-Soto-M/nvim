local K = require('modules.mappings._helper')
-- -- Keep the cursor in place while joining lines
K.normal('J', 'mzJ`z')

K.run_lua(";;", 'require("hop").hint_words()')
K.insert('jk', '<Esc>')
K.term('jk', '<C-\\><C-n>')

K.normal('<A-CR>', 'noh')
K.normal('<C-s>', ':wa')
-- K.insert('n', '<C-w><C-o>', ':MaximizerToggle!<CR>')
-- K.insert('t', '<C-w><C-o>', '<C-\\><C-n> :MaximizerToggle!<CR>')
K.normal('<C-h>', '<C-w>h')
K.normal('<C-j>', '<C-w>j')
K.normal('<C-k>', '<C-w>k')
K.normal('<C-l>', '<C-w>l')

K.normal('<C-a>', 'ggVG')