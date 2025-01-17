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
		lspconfig.pyright.setup{}
	end
}
