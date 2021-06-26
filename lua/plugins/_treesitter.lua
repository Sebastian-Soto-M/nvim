vim.api.nvim_exec([[
    packadd nvim-treesitter
    packadd nvim-treesitter-textobjects
    packadd playground
]], false)

require("nvim-treesitter.configs").setup {

    highlight = {enable = true},

    indent = {enable = true},

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
