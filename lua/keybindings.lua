-- Key Mapping
vim.g.mapleader = " "
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true }
local function nkeymap(key, map)
	keymap('n', key, map, opts)
end

-- Save, Quit, Source, Alpha
keymap('n', '<leader>w', ':w<CR>', {})
keymap('n', '<leader>q', ':q<CR>', {})
keymap('n', '<leader>s', ':so %<CR>', {})
keymap('n', '<c-n>', ':Alpha<cr>', opts)

-- Moving text lines in visual, insert and normal mode
keymap('v', 'J', ":m '>+1<CR>gv=gv", opts)
keymap('v', 'K', ":m '<-2<CR>gv=gv", opts)
keymap('i', '<C-j>', "<esc>:m .+1<CR>==", opts)
keymap('i', '<C-k>', "<esc>:m .-2<CR>==", opts)
keymap('n', '<leader>j', ":m .+1<CR>==", opts)
keymap('n', '<leader>k', ":m .-2<CR>==", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Telescope
nkeymap('<leader>ff', ':lua require("telescope.builtin").find_files({hidden=true})<cr>')
nkeymap('<leader>fg', '<cmd>Telescope live_grep<cr>')
nkeymap('<leader>fb', '<cmd>Telescope buffers<cr>')
nkeymap('<leader>fh', '<cmd>Telescope help_tags<cr>')

-- LSP Mappings
nkeymap('gd', ':lua vim.lsp.buf.definition()<cr>')
nkeymap('gD', ':lua vim.lsp.buf.declaration()<cr>')
nkeymap('gi', ':lua vim.lsp.buf.implementation()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.document_symbol()<cr>')
nkeymap('gw', ':lua vim.lsp.buf.workspace_symbol()<cr>')
nkeymap('gr', ':lua vim.lsp.buf.references()<cr>')
nkeymap('gt', ':lua vim.lsp.buf.type_definition()<cr>')
nkeymap('K', ':lua vim.lsp.buf.hover()<cr>')
nkeymap('<c-k>', ':lua vim.lsp.buf.signature_help()<cr>')
nkeymap('<leader>af', ':lua vim.lsp.buf.code_action()<cr>')
nkeymap('<leader>rn', ':lua vim.lsp.buf.rename()<cr>')
