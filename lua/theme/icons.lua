local I = {
    files = {symlink = '', default = ''},
    arrows = {left = '', right = '', down = ''},
    diagnostics = {
        warning = '',
        error = '',
        hint = '',
        info = '',
        prefix = '●'
    },
    separators = {up = '', down = ''},
    git = {
        add = '',
        delete = 'ﮁ',
        ignored = "",
        change = 'ﯽ',
        renamed = '',
        symbol = '',
        unmerged = '',
        unstaged = 'ﮖ',
        untracked = 'ﮗ'
    },
    pipe = '┃',
    bug = '',
    light_bulb = '',
    edit = '',
    modified = '',
    indicator = '',
    close = '',
    tree = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    },
    lsp = {
        text = '',
        method = 'ƒ',
        func = '',
        constructor = '',
        variable = '',
        class = '',
        interface = 'ﰮ',
        module = '',
        property = '',
        unit = '',
        value = '',
        enum = '了',
        keyword = '',
        snippet = '﬌',
        color = '',
        file = '',
        folder = '',
        enummember = '',
        constant = '',
        struct = ''
    }
}

return I
