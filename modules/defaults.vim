" Sane defaults 
set noshowmode
set nu rnu
set smartcase
set cpt+=kspell
filetype plugin indent on

" Tabs & Spaces
set expandtab
set smartindent
set smarttab
set softtabstop=4 shiftwidth=4 tabstop=4

" Backup
set nobackup
set noswapfile
set undodir=~/.config/nvim/undodir
set undofile

" Text & Braks
set textwidth=79
set breakindent
set cindent
set colorcolumn=80
set cursorline
set encoding=UTF-8
set fo-=t
set foldmethod=syntax
set nofoldenable
set clipboard=unnamedplus

" Search
set hlsearch
set ignorecase
set incsearch

" Mappings
ino <C-J> <C-O>o<C-G>u
ino <C-K> <C-O>O<C-G>u

ino jk <ESC>
nn <A-CR> :nohlsearch<cr>
no <leader>vr :so $MYVIMRC<CR>
no <silent> <leader>w :wa<CR>

" select entire file
no <c-a> ggVG

nn <c-h> <c-w>h
nn <c-j> <c-w>j
nn <c-k> <c-w>k
nn <c-l> <c-w>l

no <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
no <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

nn <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nn <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

no <silent> <leader>X :bufdo bd<CR>
no <silent> <leader>{ :bp<CR>
no <silent> <leader>} :bn<CR>
no <silent> <leader>[ :tabp<CR>
no <silent> <leader>] :tabn<CR>
no <silent> <leader>x :tabclose<CR>

no <silent> <C-c> :Commands<CR>

" Mouse
set mouse=a
let g:is_mouse_enabled = 1
noremap <silent> <Leader>m :call ToggleMouse()<CR>
function ToggleMouse()
    if g:is_mouse_enabled == 1
        echo "Mouse OFF"
        set mouse=
        let g:is_mouse_enabled = 0
    else
        echo "Mouse ON"
        set mouse=a
        let g:is_mouse_enabled = 1
    endif
endfunction

" WRAP TOGGLE
setlocal nowrap
noremap <silent> <Leader>tw :call ToggleWrap()<CR>
function ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        set virtualedit=all
        silent! nunmap <buffer> <Up>
        silent! nunmap <buffer> <Down>
        silent! nunmap <buffer> <Home>
        silent! nunmap <buffer> <End>
        silent! iunmap <buffer> <Up>
        silent! iunmap <buffer> <Down>
        silent! iunmap <buffer> <Home>
        silent! iunmap <buffer> <End>
    else
        echo "Wrap ON"
        setlocal wrap linebreak nolist
        set virtualedit=
        setlocal display+=lastline
        noremap  <buffer> <silent> <Up>   gk
        noremap  <buffer> <silent> <Down> gj
        noremap  <buffer> <silent> <Home> g<Home>
        noremap  <buffer> <silent> <End>  g<End>
        inoremap <buffer> <silent> <Up>   <C-o>gk
        inoremap <buffer> <silent> <Down> <C-o>gj
        inoremap <buffer> <silent> <Home> <C-o>g<Home>
        inoremap <buffer> <silent> <End>  <C-o>g<End>
    endif
endfunction

let g:python3_host_prog="/home/snsm/.config/virtualenvs/nvim/bin/python"

