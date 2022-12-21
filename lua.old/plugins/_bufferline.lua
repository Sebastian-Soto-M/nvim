local I = require('theme.icons')
-- require('bufferline').setup {
--   options = {
--     numbers = 'none' | 'ordinal' | 'buffer_id' | 'both',
--     number_style = 'superscript' | '' | { 'none', 'subscript' }, -- buffer_id at index 1, ordinal at index 2
--     mappings = true | false,
--     close_command = 'bdelete! %d',       -- can be a string | function, see 'Mouse actions'
--     right_mouse_command = 'bdelete! %d', -- can be a string | function, see 'Mouse actions'
--     left_mouse_command = 'buffer %d',    -- can be a string | function, see 'Mouse actions'
--     middle_mouse_command = nil,          -- can be a string | function, see 'Mouse actions'
--     -- NOTE: this plugin is designed with this icon in mind,
--     -- and so changing this is NOT recommended, this is intended
--     -- as an escape hatch for people who cannot bear it for whatever reason
--     indicator_icon = '▎',
--     buffer_close_icon = '',
--     modified_icon = '●',
--     close_icon = '',
--     left_trunc_marker = '',
--     right_trunc_marker = '',
--     max_name_length = 18,
--     max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
--     tab_size = 18,
--     diagnostics = false | 'nvim_lsp',
--     diagnostics_indicator = function(count, level, diagnostics_dict, context)
--       return '('..count..')'
--     end,
--     -- NOTE: this will be called a lot so don't do any heavy processing here
--     custom_filter = function(buf_number)
--       -- filter out filetypes you don't want to see
--       if vim.bo[buf_number].filetype ~= '<i-dont-want-to-see-this>' then
--         return true
--       end
--       -- filter out by buffer name
--       if vim.fn.bufname(buf_number) ~= '<buffer-name-I-dont-want>' then
--         return true
--       end
--       -- filter out based on arbitrary rules
--       -- e.g. filter out vim wiki buffer from tabline in your work repo
--       if vim.fn.getcwd() == '<work-repo>' and vim.bo[buf_number].filetype ~= 'wiki' then
--         return true
--       end
--     end,
--     offsets = {{filetype = 'NvimTree', text = 'File Explorer', text_align = 'left' | 'center' | 'right'}},
--     show_buffer_icons = true | false, -- disable filetype icons for buffers
--     show_buffer_close_icons = true | false,
--     show_close_icon = true | false,
--     show_tab_indicators = true | false,
--     persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
--     -- can also be a table containing 2 custom separators
--     -- [focused and unfocused]. eg: { '|', '|' }
--     enforce_regular_tabs = false | true,
--     always_show_bufferline = true | false,
--     sort_by = 'extension' | 'relative_directory' | 'directory' | function(buffer_a, buffer_b)
--       -- add custom logic
--       return buffer_a.modified > buffer_b.modified
--     end
--   }
-- }

require('bufferline').setup {
    options = {
        numbers = 'none',
        close_command = 'bdelete! %d', -- can be a string | function, see 'Mouse actions'
        right_mouse_command = 'vertical sbuffer %d', -- can be a string | function, see 'Mouse actions'
        left_mouse_command = 'buffer %d', -- can be a string | function, see 'Mouse actions'
        middle_mouse_command = 'tabnew %', -- can be a string | function, see 'Mouse actions'
        -- NOTE: this plugin is designed with this icon in mind,
        -- and so changing this is NOT recommended, this is intended
        -- as an escape hatch for people who cannot bear it for whatever reason
        indicator_icon = I.indicator,
        buffer_close_icon = I.close,
        modified_icon = I.modified,
        close_icon = I.close,
        left_trunc_marker = I.arrows.left,
        right_trunc_marker = I.arrows.right,
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 18,
        diagnostics = false,
        offsets = {
            {
                filetype = 'coc-explorer',
                text = 'File Explorer',
                text_align = 'center'
            }
        },
        show_buffer_icons = true, -- disable filetype icons for buffers
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = {'⏽', '⏽'}, -- 'slant' | 'thick' | 'thin' | { 'any', 'any' }
        enforce_regular_tabs = true,
        always_show_bufferline = true
    }
}

