local actions = require("telescope.actions")
local home = require('settings.config').HOME
local previewers = require("telescope.previewers")

require('telescope').setup({
    defaults = {
        vimgrep_arguments = {
            'rg', '--color=never', '--no-heading', '--with-filename',
            '--line-number', '--column', '--smart-case'
        },
        scroll_strategy = "cycle",
        prompt_prefix = "> ",
        selection_caret = "> ",
        entry_prefix = "  ",
        initial_mode = "insert",
        selection_strategy = "reset",
        sorting_strategy = "descending",
        layout_strategy = "flex",
        layout_config = {
            horizontal = {mirror = false},
            vertical = {mirror = false}
        },
        file_sorter = require'telescope.sorters'.get_fuzzy_file,
        file_ignore_patterns = {},
        generic_sorter = require'telescope.sorters'.get_generic_fuzzy_sorter,
        winblend = 0,
        border = {},
        borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
        color_devicons = true,
        use_less = true,
        path_display = {},
        set_env = {['COLORTERM'] = 'truecolor'}, -- default = nil,
        file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
        grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
        qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,

                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-t>"] = actions.select_tab,

                ["<C-c>"] = actions.close,
                ["<Esc>"] = actions.close,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                -- ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                -- ["<A-q>"] = actions.smart_add_to_qflist + actions.open_qflist,
                ["<Tab>"] = actions.toggle_selection
                -- ['<C-s>'] = actions.open_selected_files,
                -- ['<C-a>'] = actions.cycle_previewers_prev,
                -- ['<C-w>l'] = actions.preview_switch_window_right,
            },
            n = {
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-v>"] = actions.select_vertical,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-t>"] = actions.select_tab,
                ["<Esc>"] = actions.close,

                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,

                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down,
                ["<C-q>"] = actions.send_to_qflist,
                ["<Tab>"] = actions.toggle_selection
                -- ["<C-w>l"] = actions.preview_switch_window_right,
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = true,
            override_file_sorter = true
        },
        frecency = {
            show_scores = true,
            show_unindexed = true,
            ignore_patterns = {
                "*.git/*", "*/tmp/*", '*.vscode/*', '*node_modules/*'
            },
            workspaces = {
                ["nvim"] = home .. '/.config/nvim',
                ["automation"] = home .. '/documents/code/automation/'
            }
        }
    }
})

pcall(require("telescope").load_extension, "fzy_native") -- superfast sorter
pcall(require("telescope").load_extension, "frecency") -- frecency
pcall(require("telescope").load_extension, "coc") -- coc

local W = {slender = 0.3, narrow = 0.5, wide = 0.8}

local no_preview = function(width)
    return require("telescope.themes").get_dropdown(
               {
            borderchars = {
                {"─", "│", "─", "│", "┌", "┐", "┘", "└"},
                prompt = {"─", "│", " ", "│", "┌", "┐", "│", "│"},
                results = {
                    "─", "│", "─", "│", "├", "┤", "┘", "└"
                },
                preview = {
                    "─", "│", "─", "│", "┌", "┐", "┘", "└"
                }
            },
            width = width or W.wide,
            previewer = false
        })
end

local M = {
    buffer_fuzzy = function()
        require("telescope.builtin").current_buffer_fuzzy_find(no_preview())
    end,

    buffers = function()
        require("telescope.builtin").buffers(no_preview(W.slender))
    end,

    command_history = function()
        require("telescope.builtin").command_history(no_preview(W.narrow))
    end,

    commands = function() require("telescope.builtin").commands(no_preview()) end,

    find_files = function()
        require("telescope.builtin").find_files(
            {file_ignore_patterns = {"%.png", "%.jpg", "%.webp"}})
    end,

    frecency = function() require("telescope").extensions.frecency.frecency() end,

    git_bcommits = function() require("telescope.builtin").git_bcommits() end,

    git_branches = function()
        require("telescope.builtin").git_branches(no_preview(W.slender))
    end,

    git_commits = function() require("telescope.builtin").git_commits() end,

    git_files = function() require("telescope.builtin").git_files() end,

    git_status = function() require("telescope.builtin").git_status() end,

    help_tags = function() require("telescope.builtin").help_tags() end,

    keymaps = function()
        require("telescope.builtin").keymaps(no_preview(W.narrow))
    end,

    live_grep = function()
        require("telescope.builtin").grep_string(
            {path_display = true, search = vim.fn.input("Grep String > ")})
    end,

    lsp_code_actions = function()
        require("telescope.builtin").lsp_code_actions(no_preview())
    end,

    lsp_document_diagnostics = function()
        require("telescope.builtin").lsp_document_diagnostics()
    end,

    lsp_document_symbols = function()
        require("telescope.builtin").lsp_document_symbols(no_preview())
    end,

    lsp_references = function()
        require("telescope.builtin").lsp_references(no_preview())
    end,

    lsp_workspace_diagnostics = function()
        require("telescope.builtin").lsp_workspace_diagnostics()
    end,

    lsp_workspace_symbols = function()
        require("telescope.builtin").lsp_workspace_symbols()
    end,

    marks = function() require("telescope.builtin").marks() end,

    registers = function()
        require("telescope.builtin").registers(no_preview())
    end,

    reloader = function() require("telescope.builtin").reloader(no_preview()) end,

    search_history = function()
        require("telescope.builtin").search_history(no_preview())
    end,

    spell_suggest = function()
        require("telescope.builtin").spell_suggest(no_preview(W.slender))
    end,

    tags = function() require("telescope.builtin").tags(no_preview()) end,

    vim_options = function() require('telescope.builtin').vim_options() end
}

return setmetatable({}, {
    __index = function(_, k)
        if M[k] then
            return M[k]
        else
            return require('telescope.builtin')[k]
        end
    end
})
