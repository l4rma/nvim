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
		-- typescript
		lspconfig.tsserver.setup({
				filetypes = {
					"typescript",
				},
				root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
			})
		lspconfig.jdtls.setup{}
		lspconfig.rust_analyzer.setup{}
		lspconfig.hls.setup{}
		lspconfig.tflint.setup{}
		lspconfig.terraformls.setup{}
	end
}
