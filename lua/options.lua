local set = vim.opt

set.shiftwidth = 4
set.tabstop = 4
set.softtabstop = 4
set.ma = true -- Set buffer modifiable
set.nu = true
set.rnu = true
set.path = vim.opt.path + {'**'} -- ??
set.wrap = false
set.undodir = vim.fn.stdpath('config') .. '/undo'
set.undofile = true
set.incsearch = true
set.scrolloff = 8
set.splitbelow = true
set.splitright = true
set.ic = true
set.hlsearch = false
set.colorcolumn = "80"
set.wildignorecase = true
set.hidden = true
set.errorbells = false
set.swapfile = false
set.backup = false
set.termguicolors = true
set.wildmenu = true

-- Folding code
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false

-- Colorscheme (now set by nightfox)
vim.cmd("colorscheme gruvbox")
set.background = "dark" --'light' or 'dark'
--vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

