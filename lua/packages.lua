require('packer').startup(function()
	use 'wbthomason/packer.nvim'	-- Packception
	use 'vimwiki/vimwiki'			-- VimWiki
	use 'morhetz/gruvbox'			-- Colorscheme
	use 'tpope/vim-fugitive'		-- Git plugin
	use 'vim-airline/vim-airline'	-- Lean & mean status/tabline
	use 'preservim/nerdtree'		-- Nerdtree

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
			startify.section.bottom_buttons.val = {
				startify.button("e", "new file", ":ene <bar> startinsert <cr>"),
				startify.button("v", "neovim config", ":e ~/.config/nvim/init.lua<cr>"),
				startify.button("q", "quit nvim", ":qa<cr>"),
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
		},
	}

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Markdown Previewer
	use {
		'iamcco/markdown-preview.nvim',
		run = 'cd app && yarn install', cmd = 'MarkdownPreview'
	}

end)
