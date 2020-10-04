" Sane defaults 
set noshowmode
set nu rnu
set smartcase

" Tabs & Spaces
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
" Backup
"
set noswapfile
set nobackup
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
"
" Search
set hlsearch
set ignorecase
set incsearch

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


