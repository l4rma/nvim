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
            -- keymaps = {
            --     file_panel = {
            --         -- Custom: Open the file in a new split for editing
            --         { "n", "<C-v>", require("diffview.actions").goto_file_split, { desc = "Open file in a vertical split" } },
            --
            --         -- Custom: Open the file in a new tab page for editing
            --         { "n", "gf", require("diffview.actions").goto_file_tab, { desc = "Open file in a new tab" } },
            --     },
            -- },
        })
	end
}
