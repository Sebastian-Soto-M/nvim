local U = require('utils')
vim.cmd [[packadd vim-markdown-toc]]

local options = {vmt_auto_update_on_save = 1, vmt_cycle_list_item_markers = 1}

U.apply_globals(options)
