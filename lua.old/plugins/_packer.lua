vim.cmd [[packadd packer.nvim]]
-- git clone https://github.com/wbthomason/packer.nvim\
--  ~/.local/share/nvim/site/pack/packer/start/packer.nvim
return require('packer').startup(function(use)

    -- Development
    use {
        {'tpope/vim-dispatch', cmd = {'Dispatch', 'Start', 'Focus', 'Make'}},
        'tpope/vim-abolish', 'junegunn/vim-easy-align', -- better tabularize
    }

    -- Motion and text objects
    use {
        'mg979/vim-visual-multi',
        'christoomey/vim-sort-motion',
        'yuttie/comfortable-motion.vim', {
            'phaazon/hop.nvim',
            branch = 'v1', -- optional but strongly recommended
            config = function()
                -- you can configure Hop the way you like here; see :h hop-config
                require'hop'.setup()
            end
        }
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
