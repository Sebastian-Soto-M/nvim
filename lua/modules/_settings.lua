local U = require('utils')
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 4

vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'
vim.cmd 'set shortmess+=c'
vim.cmd 'au FileType css,scss,sass,html setlocal spell spelllang=en_us'

-- Sane defaults
opt('o', 'hidden', true) -- Round indent
opt('o', 'scrolloff', 5) -- Lines of context
opt('o', 'shiftround', true) -- Round indent
opt('o', 'showmode', false) -- Don't show the mode
opt('o', 'sidescrolloff', 10) -- Columns of context
opt('o', 'smartcase', true) -- Don't ignore case with capitals
opt('o', 'splitbelow', true) -- Put new windows below current
opt('o', 'splitright', true) -- Put new windows right of current
opt('o', 'termguicolors', true) -- True color support
opt('o', 'timeout', true) -- Timeout
opt('o', 'timeoutlen', 500) -- Timeout length
opt('o', 'wildmenu', true) -- Command-line completion mode
opt('w', 'number', true) -- Print line number
opt('w', 'relativenumber', true) -- Relative line numbers

-- Tabs & Spaces
opt('b', 'expandtab', true) -- Use spaces instead of tabs
opt('b', 'shiftwidth', indent) -- Size of an indent
opt('b', 'smartindent', true) -- Insert indents automatically
opt('b', 'softtabstop', indent)
opt('b', 'tabstop', indent) -- Number of spaces tabs count for

-- Backup
opt('b', 'undofile', true)
opt('o', 'backup', false)
opt('o', 'swapfile', false)
opt('o', 'undodir', '/home/snsm/.config/nvim/undodir')

-- Text & Breaks
opt('b', 'textwidth', 79)
opt('o', 'breakindent', true)
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'encoding', 'UTF-8')
opt('o', 'foldenable', false)
opt('o', 'foldmethod', 'syntax')
opt('w', 'cursorline', true)
vim.cmd 'set cc=80'

-- Search
opt('o', 'hlsearch', true)
opt('o', 'ignorecase', true) -- Ignore case
opt('o', 'incsearch', true)

opt('o', 'completeopt', 'menuone,noinsert,noselect') -- Completion options (for deoplete)

local globals = {
    context_enabled = 0,
    ctrlsf_auto_preview = 1,
    user_emmet_leader_key = "<C-Z>",
    python3_host_prog = "/home/snsm/.config/virtualenvs/neovim/bin/python3" -- replace with your python path
}

U.apply_globals(globals)
