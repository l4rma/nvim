return {
	'nvim-treesitter/nvim-treesitter', 
	config = function()
		local ts = require'nvim-treesitter.configs'
		ts.setup {
            ensure_installed = { "markdown", "markdown_inline", "sql", "bash", "lua", "python", "go", "json", "yaml" },
			highlight = { -- enable highlighting
				enable = true,
			},
			indent = {
				enable = true, -- default is disabled anyways
			}
		}
	end
}
