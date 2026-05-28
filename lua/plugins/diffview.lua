return {
	'sindrets/diffview.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
	config = function()
        require("diffview").setup({
            diff_binaries = false, -- Show diffs for binaries
            use_icons = true, -- Requires nvim-web-devicons
            show_help_hints = true, -- Show hints for how to open the help panel
            signs = {
                fold_closed = "",
                fold_open = "",
                done = "✓"
            },
        })
	end
}

