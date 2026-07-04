return {
    'morhetz/gruvbox',                  -- Colorscheme
    'EdenEast/nightfox.nvim',           -- Colorscheme
    'sonph/onehalf',                    -- Colorscheme
    'joshdick/onedark.vim',             -- Colorscheme
    'sainnhe/everforest',               -- Colorscheme
    'sainnhe/sonokai',                  -- Colorscheme
    'phanviet/vim-monokai-pro',         -- Colorscheme
    'sheerun/vim-polyglot',             -- Colorscheme
    'NLKNguyen/papercolor-theme',       -- Colorscheme
    'nvim-tree/nvim-web-devicons',      -- Icons
    'fatih/vim-go',                     -- Golang plugin
    'vim-test/vim-test',                    -- Testing
    'ThePrimeagen/vim-be-good',         -- Vim trainer
    'tpope/vim-surround',               -- Vim Surround
    'sotte/presenting.vim',             -- Presentation mode
    'Pocco81/true-zen.nvim',                -- Distraction free mode 
    'eandrju/cellular-automaton.nvim',  -- Funz
    'tpope/vim-repeat',                 -- Enable better '.' use
    'sindrets/diffview.nvim',           -- Diff view and Merge tool
    'diepm/vim-rest-console',           -- "Postman"
    'shortcuts/no-neck-pain.nvim',      -- Center buffer
    'tpope/vim-fugitive',               -- Git plugin
    'dhruvasagar/vim-table-mode',       -- Create md Tables

    -- Git plugin (Magit clone for nvim)
    -- { 'NeogitOrg/neogit', dependencies = 'nvim-lua/plenary.nvim' },

    -- Github Copilot
    {'github/copilot.vim'},

    -- Flutter-tools
    {
        'akinsho/flutter-tools.nvim',
        dependencies = 'nvim-lua/plenary.nvim'
    },

    -- Autopair
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    },
    -- Colorscheme
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

    -- Alpha - Vim Dashboard
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function ()
            require'alpha'.setup(require'alpha.themes.startify'.config)
            local startify = require("alpha.themes.startify")
            startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
            startify.section.top_buttons.val = {
                startify.button("e", " New file", ":ene <bar> startinsert <cr>"),
            }
            startify.section.bottom_buttons.val = {
                startify.button("v", " Neovim config", ":e ~/.config/nvim/init.lua<cr>"),
                startify.button("q", " Quit neovim", ":qa<cr>"),
            }
        end
    },
    -- LSP
    {
    },

    { "mfussenegger/nvim-jdtls", ft = { "java" }},

    -- Autocomplete
    {
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { {'nvim-lua/plenary.nvim'} }
    },

    -- Commnent.Nvim
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- Folding
    {
        'kevinhwang91/nvim-ufo', dependencies = 'kevinhwang91/promise-async'
    },
    -- Markdown Preview
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
}
