-- Treesitter
local ts = require'nvim-treesitter.configs'
ts.setup {
	ensure_installed = "maintained", -- Only use parsers that are maintained
	highlight = { -- enable highlighting
		enable = true,
	},
	indent = {
		enable = true, -- default is disabled anyways
	}
}
