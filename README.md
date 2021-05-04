# Nvim Lua Configuration

## Plugins
To check the plugins installed go to __lua>plugins>\_packer.lua__

> Some plugins have requirements, others have an optional status.
> To better understand  this file go to the [Packer documentation](https://github.com/wbthomason/packer.nvim#quickstart)

Each plugin is configured in __lua>plugins>\_pluginname.lua__
* This file is used to initalize the plugin's configurations and functions

## Mappings

Confugured in __lua>modules>mappings>\_pluginname.lua__, mappings files use the following structure:
* Table with capital letter of the plugin's name
    * Mod key
    * Chord function to use the mod key
    * Function to call the plugin
    * All the possible mappings from the plugin
* Function to initialize mappings

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

## LSP

To find detailed information about lsp configurations, read [this documentation](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md)

Below you can see the configurations I currently have working

- [x] python
- [ ] angularls
- [x] bashls
- [ ] css
- [ ] html
- [ ] json
- [x] lua
- [ ] rust
- [ ] sql
- [x] tsserver

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
- [x] typescript
- [x] yaml
