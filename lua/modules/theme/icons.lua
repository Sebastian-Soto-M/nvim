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
        symbol = '',
        delete = 'ﮁ',
        add = '',
        change = 'ﯽ',
        ignored = "",
        renamed = "➜",
        unmerged = "",
        unstaged = "ﮖ",
        untracked = "ﮗ"
    },
    pipe = '┃',
    bug = '',
    light_bulb = '',
    edit = '',
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
