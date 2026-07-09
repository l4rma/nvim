return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local dashboard = require("alpha.themes.dashboard")
        local projects = require("utils.open-project")

        dashboard.section.buttons.val = {
            dashboard.button("e", "  New file",           ":ene <bar> startinsert<cr>"),
            dashboard.button("f", "  Find file",          ":Telescope find_files<cr>"),
            dashboard.button("p", "  Open project",       projects.open_project),
            dashboard.button("r", "  Recent files",       ":Telescope oldfiles<cr>"),
            dashboard.button("v", "  Neovim config",      ":e ~/.config/nvim/init.lua<cr>"),
            dashboard.button("q", "  Quit",               ":qa<cr>"),
        }

        require("alpha").setup(dashboard.config)
    end
}
