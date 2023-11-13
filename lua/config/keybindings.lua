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

-- Set leader key to space
vim.g.mapleader = ' '

-- Save, Quit, Source, Alpha
nkeymap('<leader>w', ':w<CR>')
nkeymap('<leader>q', ':q<CR>')
nkeymap('<leader>wq', ':wq<CR>')
nkeymap('<leader>s', ':so %<CR>')
nkeymap('<c-n>', ':Alpha<cr>')

-- Highlight all
nkeymap('<leader>v', 'ggVG')

-- Yank line
nkeymap('Y', 'yy')

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

-- shift+k in visual mode open man page for highlighted word
-- Moving text lines in visual, insert and normal mode
--keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
--keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
--keymap('i', '<C-j>', "<esc>:m .+1<CR>==", opts)
--keymap('i', '<C-k>', "<esc>:m .-2<CR>==", opts)
--keymap('n', '<leader>j', ":m .+1<CR>==", opts)
--keymap('n', '<leader>k', ":m .-2<CR>==", opts)

-- Copy highlighted text to Clipboard
vkeymap('<leader>c', '"+y')
nkeymap('<leader>y', 'viw"+y')

-- Copy filename to clipboard
nkeymap('<leader>cf', ':let @+ = expand("%")<cr>')

-- Paste last yanked
nkeymap('<leader>p', '"0p')
vkeymap('<leader>p', '"0p')

-- Remove Ansi color escape code
nkeymap('<leader>rc', ':%s/\\e\\[[0-9;]*m//g<cr>')

-- Go to definition in vertical split
nkeymap('gsd', ':only<bar>vsplit<CR>gd')

-- Resize columns in pipe seperated value files
nkeymap('<leader>å', ':%s/||/| |/g<CR>:%s/||/| |/g<CR>:%! column -t -s "|"<CR>')
--nkeymap('<leader>å', ':FixPsv<CR>')

-- Format JSON file
nkeymap('<leader>fj', ':JSON<CR>') -- Ref: ./options.lua

-- Open selected text in vertical split
vkeymap('s', ':lua OpenSelectedTextInSplit()<CR>')

-------------
-- Plugins --
-------------

-- Nerdtree
-- nkeymap("<leader>n", ":NERDTreeToggle<cr>")

-- Tree
nkeymap('<leader>n', ':NvimTreeOpen<cr>')

-- Git (vim-fugitive)
nkeymap('<leader>gs', ':G<cr>')
nkeymap('<leader>gc', ':Git commit<cr>')
nkeymap('<leader>gp', ':Git push<cr>')
nkeymap('<leader>gh', ':diffget //2<cr>')
nkeymap('<leader>gl', ':diffget //3<cr>')

-- Telescope
nkeymap('<leader>t', ':lua require("telescope.builtin").find_files()<cr>')
nkeymap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nkeymap('<leader><tab>', '<cmd>Telescope buffers<cr>')
nkeymap('<leader>fh', '<cmd>Telescope help_tags<cr>')
nkeymap('<leader>fm', '<cmd>Telescope man_pages<cr>')

-- LSP
--nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
--nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
--nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
--nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
--nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
--nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
--nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
--nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
--nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
--nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
--nkeymap('<a-cr>', ':lua vim.lsp.buf.code_action()<cr>')
--nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')

-- VimWiki
-- TODO: Add shortcuts for: insert table
nkeymap('<leader>it', ':VimwikiTable 3 3<cr>')

-- Zen/Focus
nkeymap('<leader>fa', ':TZAtaraxis<cr>')
nkeymap('<leader>ff', ':TZFocus<cr>')

-- Cellular automation
nkeymap('<leader>fml', '<cmd>CellularAutomaton make_it_rain<CR>')
