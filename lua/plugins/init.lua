return {
    'morhetz/gruvbox',                  -- Colorscheme
    'EdenEast/nightfox.nvim',           -- Colorscheme
    'sonph/onehalf',                    -- Colorscheme
    'joshdick/onedark.vim',             -- Colorscheme
    -- 'sainnhe/everforest' removed; using neanias/everforest-nvim (see everforest.lua)
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
        dependencies = 'nvim-lua/plenary.nvim',
        ft = { 'dart' },
    },

    -- Autopair
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup()
        end
    },
    { "mfussenegger/nvim-jdtls", ft = { "java" }},

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
