" Install vim-plug if it isn't already
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
" Theme / Interface
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'dracula/vim', {'as':'dracula'}
call plug#end()
