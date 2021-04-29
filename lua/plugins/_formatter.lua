vim.cmd [[packadd formatter.nvim]]
-- I will use this until formatting from LSP is stable.

local prettier = function()
    return {
        exe = "prettier",
        args = {
            "--stdin-filepath", vim.api.nvim_buf_get_name(0), "--single-quote"
        },
        stdin = true
    }
end

-- local rustfmt = function()
--   return {
--     exe = "rustfmt",
--     args = {
--       "--emit=stdout"
--     },
--     stdin = true
--   }
-- end

require('formatter').setup({
    logging = false,
    filetype = {
        css = {prettier},
        html = {prettier},
        javascript = {prettier},
        json = {prettier},
        markdown = {prettier},
        python = {
            function()
                return {
                    exe = "autopep8",
                    args = {
                        "-a", "--max-line-length", 80,
                        vim.api.nvim_buf_get_name(0)
                    },
                    stdin = true
                }
            end
        },
        sass = {prettier},
        scss = {prettier},
        typescript = {prettier},
        yaml = {prettier}
    }
})
-- rust = {
--   rustfmt
-- }

-- vim.api.nvim_command [[augroup Format]]
-- vim.api.nvim_command [[autocmd! * <buffer>]]
-- vim.api.nvim_command [[autocmd BufWritePost <buffer> FormatWrite]]
-- vim.api.nvim_command [[augroup END]]

vim.api.nvim_exec([[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html,*.rs FormatWrite
augroup END
]], true)