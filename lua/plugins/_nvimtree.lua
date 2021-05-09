require('nvim-web-devicons').setup {}

local I = require('modules.theme.icons')
local apply_globals = require('utils').apply_globals

vim.cmd [[packadd nvim-tree.lua]]

-- Set some variables

local settings = {
    nvim_tree_add_trailing = 0, -- 0 by default, append a trailing slash to folder names,
    nvim_tree_auto_close = 1, -- 0 by default, closes the tree when it's the last window,
    nvim_tree_auto_ignore_ft = {'startify', 'dashboard'}, -- empty by default, don't auto open tree on specific filetypes.,
    nvim_tree_auto_open = 0, -- 0 by default, opens the tree when typing `vim $DIR` or `vim`,
    nvim_tree_disable_netrw = 1, -- 1 by default, disables netrw,
    nvim_tree_follow = 1, -- 0 by default, this option allows the cursor to be updated when entering a buffer,
    nvim_tree_git_hl = 1, -- 0 by default, will enable file highlight for git attributes (can be used without the icons).,
    nvim_tree_gitignore = 1, -- 0 by default,
    nvim_tree_group_empty = 1, -- 0 by default, compact folders that only contain a single folder into one node in the file tree,
    nvim_tree_hide_dotfiles = 1, -- 0 by default, this option hides files and folders starting with a dot `.`,
    nvim_tree_hijack_netrw = 1, -- 1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities),
    nvim_tree_ignore = {
        ".cache", ".env", ".git", ".routify", ".vscode", "__pycache__/", "dist",
        "node_modules", "target"
    },
    nvim_tree_indent_markers = 1, -- 0 by default, this option shows indent markers when folders are open,
    nvim_tree_lsp_diagnostics = 1, -- 0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics,
    nvim_tree_quit_on_open = 1, -- 0 by default, closes the tree when you open a file,
    nvim_tree_root_folder_modifier = ':~', -- This is the default. See :help filename-modifiers for more options,
    nvim_tree_show_icons = {git = 0, folders = 1, files = 1},
    nvim_tree_side = "left",
    nvim_tree_special_files = {'README.md', 'Makefile', 'MAKEFILE'}, -- List of filenames that gets highlighted with NvimTreeSpecialFile,
    nvim_tree_tab_open = 1, -- 0 by default, will open the tree when entering a new tab and the tree was previously open,
    nvim_tree_width = 30,
    nvim_tree_width_allow_resize = 1 -- 0 by default, will not resize the tree when opening a file,
}

apply_globals(settings)

local get_lua_cb = function(cb_name)
    return string.format(":lua require'nvim-tree'.on_keypress('%s')<CR>",
                         cb_name)
end

-- Mappings for nvimtree
vim.g.nvim_tree_bindings = {
    ["-"] = get_lua_cb("preview"),
    ["<BS>"] = get_lua_cb("close_node"),
    ["<C-]>"] = get_lua_cb("cd"),
    ["<C-r>"] = get_lua_cb("full_rename"),
    ["<C-t>"] = get_lua_cb("tabnew"),
    ["<C-v>"] = get_lua_cb("vsplit"),
    ["<C-x>"] = get_lua_cb("split"),
    ["<CR>"] = get_lua_cb("edit"),
    ["<S-CR>"] = get_lua_cb("close_node"),
    ["<S-Tab>"] = get_lua_cb("dir_up"),
    ["<Tab>"] = get_lua_cb("cd"),
    ["H"] = get_lua_cb("toggle_dotfiles"),
    ["I"] = get_lua_cb("toggle_ignored"),
    ["R"] = get_lua_cb("refresh"),
    ["[c"] = get_lua_cb("prev_git_item"),
    ["]c"] = get_lua_cb("next_git_item"),
    ["a"] = get_lua_cb("create"),
    ["c"] = get_lua_cb("copy"),
    ["d"] = get_lua_cb("remove"),
    ["o"] = get_lua_cb("edit"),
    ["p"] = get_lua_cb("paste"),
    ["q"] = get_lua_cb("close"),
    ["r"] = get_lua_cb("rename"),
    ["x"] = get_lua_cb("cut")
}

-- default will show icon by default if no icon is provided
-- default shows no icon by default
vim.g.nvim_tree_icons = {
    default = I.files.default .. ' ',
    symlink = I.files.symlink .. ' ',
    git = {
        deleted = I.git.delete,
        staged = I.git.change,
        ignored = I.git.ignored,
        renamed = I.git.renamed,
        unmerged = I.git.unmerged,
        unstaged = I.git.unstaged,
        untracked = I.git.untracked
    },
    folder = {
        default = I.tree.default,
        open = I.tree.open,
        empty = I.tree.empty,
        empty_open = I.tree.empty_open,
        symlink = I.tree.symlink,
        symlink_open = I.tree.symlink_open
    },
    lsp = {
        hint = I.diagnostics.hint,
        info = I.diagnostics.info,
        warning = I.diagnostics.warning,
        error = I.diagnostics.error
    }
}

