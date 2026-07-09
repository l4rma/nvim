--   _  __            __  __                   _             
--  | |/ /___ _   _  |  \/  | __ _ _ __  _ __ (_)_ __   __ _ 
--  | ' // _ \ | | | | |\/| |/ _` | '_ \| '_ \| | '_ \ / _` |
--  | . \  __/ |_| | | |  | | (_| | |_) | |_) | | | | | (_| |
--  |_|\_\___|\__, | |_|  |_|\__,_| .__/| .__/|_|_| |_|\__, |
--            |___/               |_|   |_|            |___/ 

-- Helper functions
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true }
local function vkeymap(key, map)
    keymap('v', key, map, opts)
end
local function nkeymap(key, map)
	keymap('n', key, map, opts)
end
local function ikeymap(key, map, extra_opts)
    keymap('i', key, map, vim.tbl_extend('force', opts, extra_opts or {}))
end

-- Set leader key to space
vim.g.mapleader = ' '

-- Save, Quit, Source, Alpha
nkeymap('<leader>w', ':wa<CR>')
nkeymap('<leader>q', ':q<CR>')
nkeymap('<leader>wq', ':wa<CR>:q<CR>')
--nkeymap('<leader>s', ':so %<CR>')
nkeymap('<c-n>', ':Alpha<cr>')

-- Highlight all
nkeymap('<leader>v', 'ggVG')

-- Toggle transparent background
nkeymap('<leader>b0', ':lua vim.api.nvim_set_hl(0, "Normal", {})<CR>')
nkeymap('<leader>b1', ':lua vim.api.nvim_set_hl(0, "Normal", { bg = "none" })<CR>')

-- Yank line
nkeymap('Y', 'yy')

-- Enter normal mode
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'jj', '<ESC>', opts)

-- Delete word on macOs
vim.api.nvim_set_keymap('i', '<M-bs>', '<c-w>', opts)

-- Better window navigation
nkeymap("<C-h>", "<C-w>h")
nkeymap("<C-j>", "<C-w>j")
nkeymap("<C-k>", "<C-w>k")
nkeymap("<C-l>", "<C-w>l")

-- Resize windows with arrows
nkeymap("<C-Up>", ":resize -2<CR>")
nkeymap("<C-Down>", ":resize +2<CR>")
nkeymap("<C-Left>", ":vertical resize -2<CR>")
nkeymap("<C-Right>", ":vertical resize +2<CR>")

-- Naviagate buffers
nkeymap("<S-l>", ":bnext<CR>")
nkeymap("<S-h>", ":bprevious<CR>")
nkeymap("<leader>bd", ":bd<CR>")
nkeymap("<leader>bl", ":buffers<CR>")

-- Surround highlighted text
vkeymap('"', 's""hp')
vkeymap('*', 's**hp')
vkeymap('(', 's()hp')
vkeymap('[', 's[]hp')
vkeymap('{', 's{}hp')
vkeymap(')', 's(  )hhp')
vkeymap(']', 's[  ]hhp')
vkeymap('}', 's{  }hhp')
vkeymap('\'', 's\'\'hp')

-- "_..._" as target
nkeymap('ci_', 'T_ct_')
nkeymap('vi_', 'T_vt_')

-- Copy highlighted text to Clipboard
vkeymap('<leader>c', '"+y')
nkeymap('<leader>cc', 'viW"+y')
nkeymap('<leader>y', 'viw"+y')

-- Copy filename to clipboard
nkeymap('<leader>cf', ':let @+ = expand("%:p")<cr>')

-- Paste last yanked
nkeymap('<leader>p', '"0p')
vkeymap('<leader>p', '"0p')

-- Remove Ansi color escape code
nkeymap('<leader>rc', ':%s/\\e\\[[0-9;]*m//g<cr>')

-- Make first char in current line capital
nkeymap('<leader>u', ':s/\\([a-z]\\)/\\u\\1/<cr>')


-- Go to definition in vertical split
nkeymap('gsd', ':only<bar>vsplit<CR>gd')

-- Resize columns in pipe seperated value files
nkeymap('<leader>å', ':%s/||/| |/g<CR>:%s/||/| |/g<CR>:%! column -t -s "|"<CR>')

-- Format JSON file
nkeymap('<leader>fj', ':JSON<CR>') -- Ref: ./options.lua

-- Open selected text in vertical split
vkeymap('s', ':lua OpenSelectedTextInSplit()<CR>')

-------------
-- Plugins --
-------------

-- Nerdtree
nkeymap('<leader>n', ':lua require("nvim-tree.api").tree.open({ focus = false, find_file = true, })<CR>')
vim.keymap.set('n', 'gf', function()
    local cfile = vim.fn.expand('<cfile>')
    local file_dir = vim.fn.expand('%:p:h')
    local path = vim.fn.fnamemodify(file_dir .. '/' .. cfile, ':p')
    if vim.fn.isdirectory(path) == 1 then
        require('nvim-tree.api').tree.open({ path = path, focus = true })
        vim.cmd('only')
    else
        vim.cmd('normal! gf')
    end
end, { noremap = true, silent = true })


local projects = require("utils.open-project")
vim.keymap.set("n", "<leader>fp", projects.open_project, { desc = "Open project" })

-- Git (vim-fugitive)
nkeymap('<leader>gs', ':G<cr>')
nkeymap('<leader>gg', ':G<cr>')
nkeymap('<leader>gc', ':Git commit<cr>')
nkeymap('<leader>gp', ':Git push<cr>')
nkeymap('<leader>gd', ':Gdiffsplit<cr>')
nkeymap('<leader>gh', ':diffget //2<cr>')
nkeymap('<leader>gl', ':diffget //3<cr>')
nkeymap('<leader>gb', ':Git blame<cr>')

-- Diffview
nkeymap('<leader>do', ':DiffviewOpen<cr>')
nkeymap('<leader>dh', ':DiffviewOpen HEAD<cr>')
nkeymap('<leader>dc', ':DiffviewClose<cr>')
nkeymap('<leader>dl', ':DiffviewFileHistory<cr>')
nkeymap('<leader>df', ':DiffviewFileHistory %<cr>')
nkeymap('<leader>dt', ':DiffviewToggleFiles<cr>')

-- Telescope
pcall(vim.keymap.del, 'n', '<leader>tm')
pcall(vim.keymap.del, 'n', '<leader>tt')
nkeymap('<leader>t', ':lua require("telescope.builtin").find_files({ find_command = {"rg", "--files", "--hidden", "-g", "!.git" }})<cr>')
nkeymap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nkeymap('<leader><tab>', '<cmd>Telescope buffers<cr>')
nkeymap('<leader>fh', '<cmd>Telescope help_tags<cr>')
nkeymap('<leader>fm', '<cmd>Telescope man_pages<cr>')
nkeymap('<leader>fd', ':lua require("utils.diff-picker").diff_against_picked()<CR>')
-- LSP keybindings are set in lua/plugins/lsp.lua via LspAttach


-- Obsidian.nvim
nkeymap('<leader>oo', ':ObsidianQuickSwitch<cr>')
nkeymap('<leader>os', ':ObsidianSearch<cr>')
nkeymap('<leader>on', ':ObsidianNew<cr>')
nkeymap('<leader>ot', ':ObsidianTags<cr>')
nkeymap('<leader>oi', ':ObsidianTOC<cr>') -- index / table of content
nkeymap('<leader>ob', ':ObsidianBacklinks<cr>') -- index / table of content
vim.keymap.set("n", "<leader>oc", function()
    vim.bo.modifiable = true
    vim.cmd("ObsidianTemplate")
end, { desc = "Apply Template (Force Unlock)" })

-- VimWiki
-- TODO: Add shortcuts for: insert table
nkeymap('<leader>it', ':VimwikiTable 3 3<cr>')

-- Zen/Focus
nkeymap('<leader>fa', ':TZAtaraxis<cr>')
nkeymap('<leader>ff', ':TZFocus<cr>')

-- Cellular automation
nkeymap('<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>')

-- Spelling
nkeymap('<leader>sn', ']s') -- Next spelling mistake
nkeymap('<leader>sp', '[s') -- Previous spelling mistake
nkeymap('<leader>sf', 'z=') -- Fix spelling (List of suggestions)
nkeymap('<leader>sa', 'zg') -- Add word to spelling list
nkeymap('<leader>sw', 'zw') -- Add word as wrong in spelling list

-- Copilot
nkeymap('<leader>cd', ':Copilot disable<cr>') -- Disable Copilot
nkeymap('<leader>ce', ':Copilot enable<cr>') -- Enable Copilot
ikeymap('<C-y>', 'copilot#Accept("")', { expr = true, replace_keycodes = false }) -- Accept suggestion
ikeymap('ccn', '<Plug>(copilot-next)') -- Next Copilot suggestion
ikeymap('ccp', '<Plug>(copilot-previous)') -- Previous Copilot suggestion

