local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
    scopes[scope][key] = value
    if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 4
vim.cmd 'syntax enable'
vim.cmd 'filetype plugin indent on'
vim.cmd 'set shortmess+=c'
-- Sane defaults
opt('o', 'showmode', false) -- Don't show the mode
opt('w', 'number', true) -- Print line number
opt('w', 'relativenumber', true) -- Relative line numbers
opt('o', 'smartcase', true) -- Don't ignore case with capitals
opt('o', 'termguicolors', true) -- True color support
opt('o', 'splitbelow', true) -- Put new windows below current
opt('o', 'splitright', true) -- Put new windows right of current
opt('o', 'wildmenu', true) -- Command-line completion mode
opt('o', 'scrolloff', 5) -- Lines of context
opt('o', 'sidescrolloff', 10) -- Columns of context
opt('o', 'shiftround', true) -- Round indent
opt('o', 'hidden', true) -- Round indent

-- Tabs & Spaces
opt('b', 'expandtab', true) -- Use spaces instead of tabs
opt('b', 'smartindent', true) -- Insert indents automatically
opt('b', 'shiftwidth', indent) -- Size of an indent
opt('b', 'tabstop', indent) -- Number of spaces tabs count for
opt('b', 'softtabstop', indent)

-- Backup
opt('o', 'backup', false)
opt('o', 'swapfile', false)
opt('o', 'undodir', '/home/snsm/.config/nvim/undodir')
opt('b', 'undofile', true)

-- Text & Breaks
opt('b', 'textwidth', 79)
opt('o', 'breakindent', true)
vim.cmd 'set cc=80'
opt('w', 'cursorline', true)
opt('o', 'encoding', 'UTF-8')
opt('o', 'foldmethod','syntax')
opt('o', 'foldenable', false)
opt('o', 'clipboard','unnamedplus')

-- Search
opt('o', 'hlsearch', true)
opt('o', 'ignorecase', true) -- Ignore case
opt('o', 'incsearch', true) -- Ignore case

opt('o', 'completeopt', 'menuone,noinsert,noselect') -- Completion options (for deoplete)
-- opt('o', 'hidden', true) -- Enable modified buffers in background
-- opt('o', 'joinspaces', false) -- No double spaces with join after a dot
-- opt('w', 'list', true) -- Show some invisible characters (tabs...)
-- opt('w', 'wrap', false)
