vim.cmd [[packadd packer.nvim]]
-- git clone https://github.com/wbthomason/packer.nvim\
--  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
return require('packer').startup(function(use)
    -- To handle Lua configuration
    use {'wbthomason/packer.nvim', 'tami5/sql.nvim'}
    use {'kyazdani42/nvim-web-devicons', opt = false}
    use {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}

    -- Development
    use {
        {'tpope/vim-dispatch', cmd = {'Dispatch', 'Start', 'Focus', 'Make'}},
        'machakann/vim-sandwich', 'tpope/vim-unimpaired',
        'tpope/vim-commentary', 'tpope/vim-abolish', 'junegunn/vim-easy-align', -- better tabularize
        'editorconfig/editorconfig-vim', 'dyng/ctrlsf.vim', -- edit search matches in multiple files
        {'metakirby5/codi.vim', opt = true, cmd = 'Codi'}, -- scratch pad
        { -- Sane buffer/window deletion.
            'mhinz/vim-sayonara',
            cmd = 'Sayonara',
            opt = true
        }, -- Wrapper for an external formatter
        {"mhartington/formatter.nvim", opt = true, cmd = "Format"}

    }

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-telescope/telescope-frecency.nvim',
            "nvim-telescope/telescope-fzy-native.nvim"
        }
    }

    -- Git
    use {
        'tpope/vim-fugitive', 'tpope/vim-rhubarb', 'lewis6991/gitsigns.nvim',
        { -- Vim and Neovim plugin to reveal the commit messages under the cursor
            'rhysd/git-messenger.vim',
            cmd = 'GitMessenger',
            opt = true
        }
    }

    -- Motion and text objects
    use {
        'mg979/vim-visual-multi', 'wellle/targets.vim', 'phaazon/hop.nvim',
        'unblevable/quick-scope', 'christoomey/vim-sort-motion',
        'michaeljsmith/vim-indent-object', 'yuttie/comfortable-motion.vim'
    }

    -- UI/UX
    use {
        'RRethy/vim-illuminate', -- 'glepnir/dashboard-nvim',
        'Yggdroot/indentLine', 'gennaro-tedesco/nvim-peekup', -- view register contents
        'norcalli/nvim-colorizer.lua', -- colored hex codes
        'akinsho/nvim-bufferline.lua', {'dracula/vim', as = 'dracula'},
        {'joshdick/onedark.vim', disable = true, opt = true},
        {'eddyekofo94/gruvbox-flat.nvim'}, 'szw/vim-maximizer' -- Toggle size of split windows
    }

    -- Treesitter
    use { -- Syntax
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'windwp/nvim-ts-autotag', 'p00f/nvim-ts-rainbow',
            {'nvim-treesitter/playground', opt = true}
        }
    }

    -- COC.nvim
    use {
        'fannheyward/telescope-coc.nvim',
        {'neoclide/coc.nvim', branch = 'release'}
    }

    -- Snippets
    use {
        'xabikos/vscode-javascript', 'cstrap/python-snippets',
        'ylcnfrht/vscode-python-snippet-pack'
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
                },
                {'mzlogin/vim-markdown-toc', opt = true, cmd = 'GenTocMarked'}
            },
            ft = {'markdown'}
        }, {'dhruvasagar/vim-table-mode', ft = {'text', 'markdown'}},
        {'junegunn/goyo.vim', ft = {'text', 'markdown'}, opt = true}
    }

    -- Status line
    use {'glepnir/galaxyline.nvim', branch = 'main'}

    -- Lang specific
    use {
        'mattn/emmet-vim', { -- Lua
            'euclidianAce/BetterLua.vim'
        }
    }
end)
