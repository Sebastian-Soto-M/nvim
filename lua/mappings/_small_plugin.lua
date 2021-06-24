local U = require('utils')
U.run_lua('n', ';;', 'require("hop").hint_words()')
U.run_vim('n', '<leader>sw', 'CtrlSF')
U.run_vim('n', '<leader>ss', 'CtrlSF ', false)
-- U.run_vim('<C-n>', 'NvimTreeToggle')
-- K.insert('n', '<C'-w><C-o>', ':MaximizerToggle!<CR>')
-- K.insert('t', '<C-w><C-o>', '<C-\\><C-n> :MaximizerToggle!<CR>')
U.apply_globals({
    Illuminate_delay = 300,
    Illuminate_highlightUnderCursor = 0,
    Illuminate_ftblacklist = {'coc-explorer'}
})
