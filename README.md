# Nvim Lua Configuration

<!-- vim-markdown-toc Marked -->

* [Installation](#installation)
  * [Nvim DEV](#nvim-dev)
  * [Dependencies](#dependencies)
  * [Plugins](#plugins)
* [Plugins](#plugins)
  * [Download vba file](#download-vba-file)
* [Mappings](#mappings)
  * [Table initialization](#table-initialization)
  * [Initialize mappings](#initialize-mappings)
* [Formatter](#formatter)

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

## Plugins

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

- [ ] c
- [ ] c#
- [ ] cpp
- [x] css
- [x] html
- [ ] java
- [x] javascript
- [x] json
- [x] lua
- [x] markdown
- [x] python
- [x] sass
- [x] scss
- [ ] shell script
- [ ] sql
- [x] typescript
- [x] yaml
