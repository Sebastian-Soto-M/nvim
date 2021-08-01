# Nvim Lua Configuration

<!-- vim-markdown-toc Marked -->

- [Installation](#installation)
  - [Nvim DEV](#nvim-dev)
  - [Dependencies](#dependencies)
  - [Plugins](#plugins)
  - [Download vba file](#download-vba-file)
- [Mappings](#mappings)
  - [Table initialization](#table-initialization)
  - [Initialize mappings](#initialize-mappings)
- [Formatter](#formatter)
- [Minimal VIMRC](#minimal-vimrc)
  - [Vimscript](#vimscript)

<!-- vim-markdown-toc -->

## Installation

### Nvim DEV

```shell
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update && sudo apt upgrade -y
sudo apt install neovim
```

### Dependencies

```shell
# node
nvm install --lts
npm install neovim

# python3
mkvirtualenv neovim
pip install pynvim rope autopep8 pylint
git clone https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

### Plugins

Run the following commands inside vim:

- PackerInstall

To check the plugins installed go to **lua>plugins>\_packer.lua**

> Some plugins have requirements, others have an optional status.
> To better understand this file go to the [Packer documentation](https://github.com/wbthomason/packer.nvim#quickstart)

Each plugin is configured in **lua>plugins>\_pluginname.lua**

- This file is used to initalize the plugin's configurations and functions

### Download vba file

[visincr](www.drchip.org/astronaut/vim/vbafiles/visincr.vba.gz)
[vissort](www.drchip.org/astronaut/vim/vbafiles/vissort.vba.gz)

## Mappings

Confugured in **lua>modules>mappings>\_pluginname.lua**, mappings files use the following structure:

- Table with capital letter of the plugin's name
  - Mod key
  - Chord function to use the mod key
  - Function to call the plugin
  - All the possible mappings from the plugin
- Function to initialize mappings

### Table initialization

```lua
local T = {}

T = {
    MOD = 'f',
    chord = function(key) return '<leader>' .. T.MOD .. key end,
    telescope = function(cmd)
        return 'require("plugins._telescope").' .. cmd .. '()'
    end,
    file_pickers = {
        find_files = function(keys) K.run_lua(keys, T.telescope('find_files')) end,
        frecency = function(keys) K.run_lua(keys, T.telescope('frecency')) end,
        git_files = function(keys) K.run_lua(keys, T.telescope('git_files')) end,
        live_grep = function(keys) K.run_lua(keys, T.telescope('live_grep')) end,
    },
    git = {
        --- More functions
```

### Initialize mappings

```lua
T.initialize_mappings = function()
    T.file_pickers.find_files(T.chord('F'))
    T.file_pickers.frecency(T.chord('r'))
    T.file_pickers.git_files(T.chord('f'))
end
```

## Formatter

To find detailed information about formatting configurations, read [this documentation](https://github.com/mhartington/formatter.nvim/blob/master/README.md)

Below you can see the configurations I currently have working

- [x] html

- [x] javascript
- [x] typescript

- [x] json

- [x] css
- [x] sass
- [x] scss

- [x] dart
- [x] java
- [x] lua
- [x] python

- [x] markdown
- [x] yaml

## Minimal VIMRC

### Vimscript

```vimscript
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

```
