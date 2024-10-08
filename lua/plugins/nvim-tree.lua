return {
	'nvim-tree/nvim-tree.lua',
	dependencies = {
		'nvim-tree/nvim-web-devicons', -- optional
	},
	config = function()
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- set termguicolors to enable highlight groups
		vim.opt.termguicolors = true

		local function my_on_attach(bufnr)
			local api = require "nvim-tree.api"

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set('n', '<C-r>', api.tree.change_root_to_node,          opts('Up'))
			vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
			vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
		end

		-- OR setup with some options
		require("nvim-tree").setup({
				on_attach = my_on_attach,
				sort_by = "case_sensitive",
				actions = {
				    open_file = {
				      quit_on_open = true,
					},
				},
				view = {
					width = 30,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
				actions = {
					open_file = {
						quit_on_open = true,
					},
				},
			})
	end
}

