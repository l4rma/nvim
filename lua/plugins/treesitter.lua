return {
	'nvim-treesitter/nvim-treesitter', 
	config = function()
		local ts = require'nvim-treesitter.configs'
		ts.setup {
			ensure_installed = "all", -- Only use parsers that are maintained
			highlight = { -- enable highlighting
				enable = true,
			},
			indent = {
				enable = true, -- default is disabled anyways
			}
		}
	end
}
