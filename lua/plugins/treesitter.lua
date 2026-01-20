return {
	'nvim-treesitter/nvim-treesitter', 
	config = function()
		local ts = require'nvim-treesitter.configs'
		ts.setup {
			highlight = { -- enable highlighting
				enable = true,
			},
			indent = {
				enable = true, -- default is disabled anyways
			}
		}
	end
}
