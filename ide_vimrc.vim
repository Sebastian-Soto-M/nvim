"   ___        _   _
"  / _ \ _ __ | |_(_) ___  _ __  ___
" | | | | '_ \| __| |/ _ \| '_ \/ __|
" | |_| | |_) | |_| | (_) | | | \__ \
"  \___/| .__/ \__|_|\___/|_| |_|___/
"       |_|
set hidden
set scrolloff=5 sidescrolloff=10
set shiftround
set noshowmode
set ignorecase smartcase
set splitbelow splitright
set number relativenumber
set signcolumn="yes"
set mouse="a"
set nobackup nowritebackup noswapfile 
set undofile undodir=/home/snsm/.config/nvim/undodir " change the path
set expandtab smarttab smartindent
set shiftwidth=2 tabstop=2 softtabstop=2
set textwidth=79 colorcolumn=80
set clipboard="unnamedplus"

"  __  __                   _
" |  \/  | __ _ _ __  _ __ (_)_ __   __ _ ___
" | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` / __|
" | |  | | (_| | |_) | |_) | | | | | (_| \__ \
" |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |___/
"              |_|   |_|            |___/
nn Y y$ " expected behavior
nn N Nzzzv " center before search
nn J mzJ`z " keep cursor where it was after joining lines
" Undo break points
ino , ,<c-g>u
ino . .<c-g>u
ino ? ?<c-g>u
ino ! !<c-g>u
ino ; ;<c-g>u
ino : :<c-g>u
" Jumplist mutations
nn <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nn <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
" Text motion
ino <C-j> <esc>:m .+1<CR>==
ino <C-k> <esc>:m .-2<CR>==
nn <leader>j :m .+1<CR>==
nn <leader>k :m .-2<CR>==
vn J :m '>+1<CR>gv=gv
vn K :m '<-2<CR>gv=gv

