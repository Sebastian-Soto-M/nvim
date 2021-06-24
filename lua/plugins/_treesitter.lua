vim.api.nvim_exec([[
    packadd nvim-treesitter
    packadd nvim-treesitter-pairs
    packadd nvim-treesitter-textobjects
    packadd nvim-ts-autotag
    packadd playground
]], false)

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "javascript", "typescript", "tsx", "jsdoc", "cpp", "jsonc", "html",
        "css", "lua", "java", "query", "python"
    },

    highlight = {enable = true},

    indent = {enable = true},

    autotag = {enable = true},

    playground = {enable = true},

    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner"
            }
        },
        swap = {
            enable = true,
            swap_next = {["<Leader>a"] = "@parameter.inner"},
            swap_previous = {["<Leader>A"] = "@parameter.inner"}
        },
        lsp_interop = {enable = true}
    }
}
