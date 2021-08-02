require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'always',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = {
        border = {'', '', '', ' ', '', '', '', ' '}, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = 'NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder',
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1
    },
    source = {
        path = true,
        luasnip = true,
        vsnip = true,
        nvim_lsp = true,
        buffer = true,
        calc = true,
        nvim_lua = true
    }
}

--  _   _ _   _ _
-- | | | | |_(_) |___
-- | | | | __| | / __|
-- | |_| | |_| | \__ \
--  \___/ \__|_|_|___/
local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

local luasnip = require('luasnip')

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-n>'
    elseif luasnip.expand_or_jumpable() then
        return t '<Plug>luasnip-expand-or-jump'
    elseif vim.fn['vsnip#available'](1) == 1 then
        return t '<Plug>(vsnip-expand-or-jump)'
    elseif check_back_space() then
        return t '<Tab>'
    else
        return vim.fn['compe#complete']()
    end
end

_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t '<C-p>'
    elseif luasnip.jumpable(-1) then
        return t '<Plug>luasnip-jump-prev'
    elseif vim.fn['vsnip#jumpable'](-1) == 1 then
        -- If <S-Tab> is not working in your terminal, change it to <C-h>
        return t '<Plug>(vsnip-jump-prev)'
    else
        return t '<S-Tab>'
    end
end

--  __  __                   _
-- |  \/  | __ _ _ __  _ __ (_)_ __   __ _ ___
-- | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` / __|
-- | |  | | (_| | |_) | |_) | | | | | (_| \__ \
-- |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
--              |_|   |_|            |___/
-- Map tab to the above tab complete functions
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<Tab>', 'v:lua.tab_complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})
vim.api.nvim_set_keymap('s', '<S-Tab>', 'v:lua.s_tab_complete()', {expr = true})

-- Map compe confirm and complete functions
vim.api.nvim_set_keymap('i', '<c-space>', 'compe#complete()', {expr = true})
vim.api.nvim_set_keymap('i', '<CR>',
                        'compe#confirm({ "keys": "<CR>", "select": v:true })',
                        {expr = true})