vim.cmd [[packadd packer.nvim]]
-- git clone https://github.com/wbthomason/packer.nvim\
--  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
return require('packer').startup(function(use)
    -- To handle Lua configuration
    use {'wbthomason/packer.nvim', 'tami5/sql.nvim'}

    -- Development
    use {
        'tpope/vim-dispatch', 'machakann/vim-sandwich', 'tpope/vim-unimpaired',
        'tpope/vim-abolish', 'junegunn/vim-easy-align', -- better tabularize
        'editorconfig/editorconfig-vim', 'dyng/ctrlsf.vim', -- edit search matches in multiple files 
        {'metakirby5/codi.vim', opt = true, cmd = 'Codi'}, -- scratch pad
        { -- Sane buffer/window deletion.
            'mhinz/vim-sayonara',
            cmd = 'Sayonara',
            opt = true
        }
    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope-frecency.nvim',
            "nvim-telescope/telescope-fzy-native.nvim"
        }
    }

    -- Git
    use {
        'tpope/vim-fugitive', 'tpope/vim-rhubarb', 'lewis6991/gitsigns.nvim',
        'TimUntersberger/neogit',
        { -- Vim and Neovim plugin to reveal the commit messages under the cursor
            'rhysd/git-messenger.vim',
            cmd = 'GitMessenger',
            opt = true
        }
    }

    -- Motion and text objects
    use {
        'wellle/targets.vim', 'phaazon/hop.nvim', 'unblevable/quick-scope',
        'christoomey/vim-sort-motion', 'michaeljsmith/vim-indent-object'
    }

    -- UI/UX
    use {
        'RRethy/vim-illuminate', -- 'glepnir/dashboard-nvim', 
        'Yggdroot/indentLine', 'wellle/context.vim', -- Shows the function name you are working on
        'gennaro-tedesco/nvim-peekup', -- view register contents
        'liuchengxu/vim-which-key', 'norcalli/nvim-colorizer.lua', -- colored hex codes
        {'akinsho/nvim-bufferline.lua', opt = true},
        {'dracula/vim', as = 'dracula'},
        {'joshdick/onedark.vim', disable = true, opt = true},
        {'kyazdani42/nvim-tree.lua', opt = true},
        {'kyazdani42/nvim-web-devicons', opt = false},
        {'morhetz/gruvbox', disable = false, opt = true}, 'szw/vim-maximizer' -- Toggle size of split windows
    }

    -- Treesitter
    use { -- Syntax
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'theHamsta/nvim-treesitter-pairs', 'windwp/nvim-ts-autotag',
            'p00f/nvim-ts-rainbow', {
                'JoosepAlviste/nvim-ts-context-commentstring',
                requires = {'tpope/vim-commentary'}
            }, {'nvim-treesitter/playground', opt = true}
        }
    }

    -- LSP
    use {
        'glepnir/lspsaga.nvim', -- code definitions and references popup
        'neovim/nvim-lspconfig', 'onsails/lspkind-nvim', -- icons to lsp suggestion hrsh7th/nvim-compes
        'ray-x/lsp_signature.nvim', 'tjdevries/nlua.nvim', -- lua 
        {'mhartington/formatter.nvim', opt = true, cmd = 'Format'},
        {'jose-elias-alvarez/nvim-lsp-ts-utils', opt = false}, -- typescript
        {'mfussenegger/nvim-jdtls', opt = false}, -- java
        {
            "folke/lsp-trouble.nvim",
            config = function()
                require("trouble").setup {
                    auto_close = true,
                    signs = {},
                    use_lsp_diagnostic_signs = true
                }
            end
        }
    }

    -- Snippets
    use {
        'hrsh7th/nvim-compe', 'hrsh7th/vim-vsnip', 'cstrap/python-snippets',
        'ylcnfrht/vscode-python-snippet-pack', 'xabikos/vscode-javascript'
    }

    -- Project
    use {
        'nvim-telescope/telescope-project.nvim', 'airblade/vim-rooter',
        'tpope/vim-projectionist'
    }

    -- Documents
    use {
        { -- Latex
            'lervag/vimtex',
            opt = true,
            ft = {'tex', 'aux', 'fd', 'blg', 'brf', 'cls', 'dtx'}
        }, { -- Markdown
            'plasticboy/vim-markdown',
            requires = {
                {
                    'iamcco/markdown-preview.nvim',
                    run = 'cd app && yarn install',
                    opt = true
                }
            },
            ft = {'markdown'}
        }, {'dhruvasagar/vim-table-mode', ft = {'text', 'markdown'}},
        {'junegunn/goyo.vim', ft = {'text', 'markdown'}, opt = true}
    }

    -- Status line
    use {'glepnir/galaxyline.nvim', branch = 'main'}

end)