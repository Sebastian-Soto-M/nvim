-- Case
vim.o.ignorecase = true
vim.o.smartcase = true
-- Width, Indent, Tabs
vim.o.breakindent = true
vim.opt.expandtab = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
-- UI
vim.opt.colorcolumn = "80"
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.wo.nu = true
vim.wo.signcolumn = 'yes'
-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- Undo
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- Others
vim.o.completeopt = 'menuone,noselect'
vim.o.mouse = 'a'
vim.o.updatetime = 50
vim.opt.isfname:append("@-@")
