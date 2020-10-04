" Install vim-plug if it isn't already
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Theme / Interface
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'josa42/vim-lightline-coc'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'yuttie/comfortable-motion.vim'
" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Search & Replace
Plug 'tpope/vim-abolish' 
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-surround'
" Motion
Plug 'christoomey/vim-sort-motion'
Plug 'michaeljsmith/vim-indent-object'
call plug#end()
