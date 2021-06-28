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
    close = '',
    tree = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = ""
    }
}
return I
