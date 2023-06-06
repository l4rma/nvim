-- ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
-- ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
-- ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
-- ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
-- ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
-- ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'	-- Packception

	-- My plugins here
	use 'vimwiki/vimwiki'					-- VimWiki
	use 'morhetz/gruvbox'					-- Colorscheme
	use 'EdenEast/nightfox.nvim'			-- Colorscheme
	use 'sonph/onehalf'						-- Colorscheme
	use 'joshdick/onedark.vim'				-- Colorscheme
	use 'sainnhe/everforest'				-- Colorscheme
	use 'sainnhe/sonokai'					-- Colorscheme
	use 'phanviet/vim-monokai-pro'  		-- Colorscheme
	use 'sheerun/vim-polyglot'				-- Colorscheme
	use 'NLKNguyen/papercolor-theme'		-- Colorscheme
	use 'tpope/vim-fugitive'				-- Git plugin
	use 'preservim/nerdtree'				-- Nerdtree
	use 'nvim-tree/nvim-web-devicons'		-- Icons
	use 'fatih/vim-go'						-- Golang plugin
	use 'vim-test/vim-test'					-- Testing
	use 'ThePrimeagen/vim-be-good'  		-- Vim trainer
	use 'tpope/vim-surround'				-- Vim Surround
	use 'sotte/presenting.vim'				-- Presentation mode
	use 'Pocco81/true-zen.nvim'				-- Distraction free mode 
	use 'eandrju/cellular-automaton.nvim'	-- Funz
	use 'tpope/vim-repeat'					-- Enable better '.' use

	-- Center buffer
	use {"shortcuts/no-neck-pain.nvim", tag = "*" }

	-- Flutter-tools
	use {
		'akinsho/flutter-tools.nvim',
		requires = 'nvim-lua/plenary.nvim'
	}

	-- Status Line
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Autopair
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup()
		end
	}

	-- Alpha - Vim Dashboard
	use {
		'goolord/alpha-nvim',
		requires = { 'nvim-tree/nvim-web-devicons' },
		config = function ()
			require'alpha'.setup(require'alpha.themes.startify'.config)
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

	use { "mfussenegger/nvim-jdtls", ft = { "java" }}

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

	-- Commnent.Nvim
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}

	-- Markdown Preview
	-- install without yarn or npm
	--use({
	--	"iamcco/markdown-preview.nvim",
	--	run = function() vim.fn["mkdp#util#install"]() end,
	--})

	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

	-- Automatically set up configuration after cloning packer.nvim
	if packer_bootstrap then
		require('packer').sync()
	end
end)
