-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	is_bootstrap = true
	vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
	vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
	-- Package manager
	use 'wbthomason/packer.nvim'

	-- Sane Bundle
	--------------
	use {
		'christoomey/vim-sort-motion',
		'dyng/ctrlsf.vim', -- Search matches and edit them
		'machakann/vim-sandwich',
		'mbbill/undotree',
		'navarasu/onedark.nvim', -- Theme inspired by Atom
		'nvim-lualine/lualine.nvim', -- Fancier statusline
		'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
		'michaeljsmith/vim-indent-object',
		'unblevable/quick-scope',
		'wellle/targets.vim', -- MUST HAVE: https://github.com/wellle/targets.vim
		"windwp/nvim-autopairs",
		{
			'numToStr/Comment.nvim',
			config = function() require('Comment').setup() end
		}, -- "gc" to comment visual regions/lines
		{ -- Add indentation guides even on blank lines
			'lukas-reineke/indent-blankline.nvim',
			config = function()
				require('indent_blankline').setup {
					char = '┊',
					show_trailing_blankline_indent = false
				}
			end
		},
	}

	-- Fuzzy Finder (files, lsp, etc)
	---------------------------------
	use {
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-frecency.nvim',
			-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }
		}
	}

	-- Highlight, edit, and navigate code
	-------------------------------------
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
	}
	use('nvim-treesitter/playground')
	use { -- Additional text objects via treesitter
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}

	-- Git related plugins
	-------------------------------------
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'lewis6991/gitsigns.nvim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },
			-- Snippets
			{
				'L3MON4D3/LuaSnip',
				'rafamadriz/friendly-snippets',
				'saadparwaiz1/cmp_luasnip'
			},
			-- Useful status updates for LSP
			use { 'j-hui/fidget.nvim', config = function() require('fidget').setup() end },
			-- Additional lua configuration, makes nvim stuff amazing
			use { 'folke/neodev.nvim', config = function() require('neodev').setup() end },
		}
	}

	use {
		'akinsho/flutter-tools.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function() require('flutter-tools').setup() end
	}

	-- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
	local has_plugins, plugins = pcall(require, 'custom.plugins')
	if has_plugins then
		plugins(use)
	end

	if is_bootstrap then
		require('packer').sync()
	end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
	print '=================================='
	print '    Plugins are being installed'
	print '    Wait until Packer completes,'
	print '       then restart nvim'
	print '=================================='
	return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
	command = 'source <afile> | PackerCompile',
	group = packer_group,
	pattern = vim.fn.expand '$MYVIMRC',
})
