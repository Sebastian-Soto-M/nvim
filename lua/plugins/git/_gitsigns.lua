local I = require('modules.theme.icons')
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = I.pipe, numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = I.pipe, numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = I.pipe, numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = I.pipe, numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = I.pipe, numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  numhl = false,
  linehl = false,
  keymaps = {
    -- Default keymap options
    noremap = true,
    buffer = true,

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
  },
  watch_index = {
    interval = 1000
  },
  current_line_blame = true,
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  use_decoration_api = true,
  use_internal_diff = true,  -- If luajit is present
}