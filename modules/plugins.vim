" Install vim-plug if it isn't already
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Theme / Interface
Plug 'chrisbra/Colorizer'
Plug 'dracula/vim', {'as':'dracula'}
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'josa42/vim-lightline-coc'
Plug 'yuttie/comfortable-motion.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'bagrat/vim-buffet'
" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'antoinemadec/coc-fzf'

" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" Search & Replace
Plug 'tpope/vim-abolish' 
Plug 'unblevable/quick-scope'
Plug 'tpope/vim-surround'

" Motion
Plug 'christoomey/vim-sort-motion'
Plug 'michaeljsmith/vim-indent-object'

" Git
Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'

" Format
Plug 'preservim/nerdcommenter'
Plug 'dhruvasagar/vim-table-mode'
Plug 'Chiel92/vim-autoformat'

" FileType

    " CSV
Plug 'chrisbra/csv.vim'

    " HTML
Plug 'mattn/emmet-vim'

    " Markdown
Plug 'godlygeek/tabular'
Plug 'mzlogin/vim-markdown-toc'
Plug 'plasticboy/vim-markdown'

    " Typescript
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim' " TypeScript syntax

" Development
Plug 'honza/vim-snippets'
Plug 'preservim/tagbar'
Plug 'puremourning/vimspector' 

call plug#end()
