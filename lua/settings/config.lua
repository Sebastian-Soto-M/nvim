local C = {}
local COLORS = require('theme.colors')

local THEMES = {
    gruvbox_flat = {name = 'gruvbox-flat', colors = COLORS['gruvbox']},
    gruvbox = {name = 'gruvbox', colors = COLORS['gruvbox']},
    dracula = {name = 'dracula', colors = COLORS['dracula']}
}

C.THEME = THEMES.gruvbox_flat
C.HOME = os.getenv("HOME")
return C
