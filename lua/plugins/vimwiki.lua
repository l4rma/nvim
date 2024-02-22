return {
	'vimwiki/vimwiki',					-- 
	config = function()
		-- VimWiki directory and filetype
		vim.cmd("let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/','syntax': 'markdown', 'ext': '.md'}]")
		vim.api.nvim_set_keymap('n', '<leader>wt', ':lua require("telescope.builtin").find_files()<cr>', {})
		vim.api.nvim_set_keymap('n', '<leader>w<leader>t', ':lua require("telescope.builtin").find_files()<cr>', {})
	end
}
