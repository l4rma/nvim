-- Config
local set = vim.opt

set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.nu = true
set.rnu = true
set.path = vim.opt.path + {'**'} -- ??
set.wrap = false
set.undodir = vim.fn.stdpath('config') .. '/undo'
set.undofile = true
set.incsearch = true
set.scrolloff = 8
set.splitbelow = true
set.splitright = true
set.ic = true
set.hlsearch = false
set.colorcolumn = "80"
set.wildignorecase = true
set.hidden = true
set.errorbells = false
set.swapfile = false
set.backup = false
set.wildmenu = true

-- Folding code
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false

-- Set Colorscheme Gruvbox
set.background = "dark"
vim.cmd("colorscheme gruvbox")

-- Treesitter
local configs = require'nvim-treesitter.configs'
configs.setup {
	ensure_installed = "maintained", -- Only use parsers that are maintained
	highlight = { -- enable highlighting
		enable = true,
	},
	indent = {
		enable = true, -- default is disabled anyways
	}
}


-- LSP
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}
	if server.name == "sumneko_lua" then
		opts = {
			settings = {
				Lua = {
					diagnostics = {
						globals = { 'vim', 'use' }
					},
				}
			}
		}
	end
    server:setup(opts)
end)

