-- Auto install packer
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Install plugins
return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Dashboard plugin for nvim startup
	use {
		'glepnir/dashboard-nvim',
		config = function() require('max/dashboard') end,
		event = 'VimEnter'
	}

	-- Color Schemes
	use {
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.cmd('colorscheme catppuccin')
		end
	}

	-- Interface Plugins
	use("kyazdani42/nvim-web-devicons")

	use { 'akinsho/bufferline.nvim', tag = "v3.*" }

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	use('karb94/neoscroll.nvim')

	use {
		"m4xshen/smartcolumn.nvim",
		config = function()
			require("smartcolumn").setup()
		end
	}

	-- Productivity Plugins
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons"
	}

	use('mbbill/undotree')

	use('tpope/vim-fugitive')

	use('nvim-tree/nvim-tree.lua')

	use("windwp/nvim-autopairs")

	use "terrortylor/nvim-comment"

	use 'famiu/bufdelete.nvim'

	use {
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup()
		end
	}

	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup()
		end
	}

	-- LSP Plugins
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },    -- Required
			{ 'williamboman/mason.nvim' },  -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' }, -- Required
			{ 'hrsh7th/cmp-nvim-lsp' }, -- Required
			{ 'hrsh7th/cmp-buffer' }, -- Optional
			{ 'hrsh7th/cmp-path' }, -- Optional
			{ 'saadparwaiz1/cmp_luasnip' }, -- Optional
			{ 'hrsh7th/cmp-nvim-lua' }, -- Optional

			-- Formating
			{ 'nvim-lua/plenary.nvim' },
			{ 'jose-elias-alvarez/null-ls.nvim' }, -- Required
			{ 'MunifTanjim/prettier.nvim' }, -- Required

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },    -- Required
			{ 'rafamadriz/friendly-snippets' }, -- Optional
		}
	}

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require('packer').sync()
	end
end)
