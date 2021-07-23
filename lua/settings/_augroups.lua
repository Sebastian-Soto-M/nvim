-- TODO look at some pcall wrapping so everthing doesn't break if single error
local api = vim.api

local definitions = {
    remove_trailing_whitespace = {
        -- FIXME this moves the cursor, so need to set mark and jump back
        {"BufWritePre", "*", [[%s/\s\+$//e]]}
    },
    -- FIXME this loads on filetype correctly
    -- but fun is unable to set buffer options
    lua_filetype_loading = {
        {
            "VimEnter,FileType", "*",
            "lua require('utils').load_filetype_config()"
        }
    },
    indent_line_reset = {{"BufRead", "*", "IndentLinesReset"}},
    format_on_save = {{"BufWritePost", "*", "Format"}}
}

for group, definition in pairs(definitions) do
    api.nvim_command('augroup ' .. group)
    api.nvim_command('autocmd!')
    for _, line in ipairs(definition) do
        local command = table.concat(vim.tbl_flatten {'autocmd', line}, ' ')
        api.nvim_command(command)
    end
    api.nvim_command('augroup END')
end
