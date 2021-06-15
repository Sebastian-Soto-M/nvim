local U = require('utils')
U.apply_indentation(2)

U.run_vim('n', '<leader>r', 'CocCommand python.execInTerminal', nil, 'b')
U.run_vim('n', '<leader>r', 'CocCommand python.execInTerminal', nil, 'b')

vim.api.nvim_exec([[autocmd BufWritePost *.py !isort %]], true)
