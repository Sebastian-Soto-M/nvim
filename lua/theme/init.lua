local C = require('settings.config')
local U = require('utils')
require("theme._statusline")

if C.THEME.name == 'gruvbox' then
    U.apply_globals({
        gruvbox_contrast_dark = 'hard',
        gruvbox_hls_cursor = 'aqua',
        gruvbox_italic = 0,
        gruvbox_bold = 1,
        gruvbox_invert_selection = 0,
        gruvbox_color_column = 'bg3',
        gruvbox_italicize_strings = 1
    })
end

if C.THEME.name == 'gruvbox-flat' then
    U.apply_globals({
        gruvbox_flat_style = 'hard',
        gruvbox_transparent = false,
        gruvbox_sidebars = {'coc-explorer'},
        gruvbox_dark_sidebar = true,
        gruvbox_dark_float = false
    })
end

vim.cmd('colorscheme ' .. C.THEME.name)
