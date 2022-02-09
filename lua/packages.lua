require('packer').startup(function()
	use 'wbthomason/packer.nvim'	-- Packception
	use 'vimwiki/vimwiki'			-- VimWiki
	use 'morhetz/gruvbox'			-- Colorscheme
	use 'EdenEast/nightfox.nvim'	-- Colorscheme
	use 'tpope/vim-fugitive'		-- Git plugin
	--use 'vim-airline/vim-airline'	-- Lean & mean status/tabline
	use 'preservim/nerdtree'		-- Nerdtree
	use 'ryanoasis/vim-devicons'	-- Icons
	use 'fatih/vim-go'				-- Golang plugin

	--Flutter-tools
	use {
		'akinsho/flutter-tools.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}

	--Status Line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Autopair
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end
	}

	-- Alpha-nvim Dashboard
	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.opts)
			local startify = require("alpha.themes.startify")
			startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
			startify.section.top_buttons.val = {
				startify.button("e", " New file", ":ene <bar> startinsert <cr>"),
			}
			startify.section.bottom_buttons.val = {
				startify.button("v", " Neovim config", ":e ~/.config/nvim/init.lua<cr>"),
				startify.button("q", " Quit neovim", ":qa<cr>"),
			}
		end
	}

	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'

	-- LSP
	use 'neovim/nvim-lspconfig'
	use 'williamboman/nvim-lsp-installer'

	-- Autocomplete
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'saadparwaiz1/cmp_luasnip',
			'rafamadriz/friendly-snippets',
		},
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Markdown Previewer
	use({ "iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
		ft = { "markdown" },
	})

	-- Commnent.Nvim
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

end)
