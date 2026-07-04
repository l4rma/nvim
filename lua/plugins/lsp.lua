return {
	'neovim/nvim-lspconfig',
	config = function()
		local lspconfig = require('lspconfig')
		lspconfig.lua_ls.setup {
			settings = {
				Lua = {
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = {'vim'},
					},
				},
			},
		}
		lspconfig.rust_analyzer.setup{}
		lspconfig.hls.setup{}
		lspconfig.gopls.setup{}
		lspconfig.terraformls.setup{}
		lspconfig.html.setup{}
		lspconfig.eslint.setup{
			filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
			root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()),
			init_options = {
				linters = {},
				loadPlugins = false,
				extensions = {},
				-- Automatically fix problems
				fix = true,
				format = true,
			},
		}
		lspconfig.tsserver.setup{}
		lspconfig.tailwindcss.setup{}
	end
}
