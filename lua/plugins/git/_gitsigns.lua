local I = require('theme.icons')
require('gitsigns').setup {
    count_chars = {
        [1] = '₁',
        [2] = '₂',
        [3] = '₃',
        [4] = '₄',
        [5] = '₅',
        [6] = '₆',
        [7] = '₇',
        [8] = '₈',
        [9] = '₉',
        ['+'] = '₊'
    },
    current_line_blame = false,
    diff_opts = {
        internal = true,
        algorithm = 'minimal'
    },
    keymaps = {
        noremap = true,
        buffer = true,
        ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
        ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
    },
    numhl = true,
    sign_priority = 6,
    status_formatter = nil, -- Use default
    update_debounce = 100,
    watch_gitdir = {
        enable = true,
        interval = 1000,
        follow_files = true
    },

    signs = {
        add = {
            hl = 'GitSignsAdd',
            text = I.pipe,
            numhl = 'GitSignsAddNr',
            linehl = 'GitSignsAddLn'
        },
        change = {
            hl = 'GitSignsChange',
            text = I.pipe,
            numhl = 'GitSignsChangeNr',
            linehl = 'GitSignsChangeLn'
        },
        delete = {
            hl = 'GitSignsDelete',
            text = I.pipe,
            numhl = 'GitSignsDeleteNr',
            linehl = 'GitSignsDeleteLn',
            show_count = true
        },
        topdelete = {
            hl = 'GitSignsTopdelete',
            text = I.pipe,
            numhl = 'GitSignsTopdeleteNr',
            linehl = 'GitSignsTopdeleteLn'
        },
        changedelete = {
            hl = 'GitSignsChangedelete',
            text = I.pipe,
            numhl = 'GitSignsChangedeleteNr',
            linehl = 'GitSignsChangedeleteLn'
        },
        untracked = {
            hl = 'GitSignsUntracked',
            text = I.pipe,
            numhl = 'GitSignsUntrackedNr',
            linehl = 'GitSignsUntrackedLn'
        }
    }
}
