local set = vim.opt

-- More information about the settings can be found in ':h set-option'
set.sw = 4                                        -- Shift width: tab size
set.ts = 4                                        -- Tab Stop: tab size
set.sts = 4                                       -- Soft Tab Stop: tab size
set.ma = true                                     -- Modifiable: modifiable buffers
set.nu = true                                     -- Line numbers
set.rnu = true                                    -- Relative line numbers
set.pa = set.pa + {'**'}                          -- Path: where to look when searching i.e. gf
set.wrap = false                                  -- Wrap text in buffer
set.undodir = vim.fn.stdpath('config') .. '/undo' -- Store undofile in .config/nvim/undo/
set.udf = true                                    -- Undofile: Use the undofile
set.is = true                                     -- Inc Search: Highlight pattern while searching
set.so = 8                                        -- Scroll Off: Lines to end of screen when scolling
set.siso = 12                                     -- Side Scroll Off 
set.sb = true                                     -- Split Below
set.spr = true                                    -- Split Right
set.ic = true                                     -- Ignore Case: when searching.
set.hls = false                                   -- Highlight Search: Highlight previous pattern matches.
set.cc = "80"                                     -- Color Column: Highlight column at 80 spaces
set.wic = true                                    -- Wild Ignore Case: Ignore case when completing file/dir names
set.hid = true                                    -- Hidden: Keep hidden buffers
set.eb = false                                    -- Error Bells: No beep og screen flashing on errors
set.swf = false                                   -- Swap File: Don't use swap file for the buffer.
set.bk = false                                    -- Backup: Don't make backup files.
set.tgc = true                                    -- Term Gui Colors: Enable 24-bit RGB color
set.wmnu = true                                   -- Wild Menu: Tab auto complete in command line.

-- Set GUI Cursor: Block. Blinking in insert-mode. Underline in replace-mode and while operation pending
set.gcr = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,i:blinkwait0-blinkoff400-blinkon250-Cursor/lCursor" 

-- Folding code
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false

-- Colorscheme
vim.cmd("colorscheme everforest")
set.background = "dark" --'light' or 'dark'
--vim.cmd("hi Normal guibg=NONE ctermbg=NONE")

-- VimWiki directory and filetype
vim.cmd("let g:vimwiki_list = [{'path': '$HOME/Dropbox/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]")
 
-- Telescope flutter extention
require("telescope").load_extension("flutter")

-- Presentation Mode
-- Auto when opening .vpm files
-- Keybinds: n: next slide, N: prev slide, f: Ataraxis
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.vpm"},
  callback = function() 
    set.colorcolumn = ""
    vim.api.nvim_set_keymap('n', 'n', ':n<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', 'N', ':N<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', 'f', ':TZAtaraxis<cr>', { noremap = true })
  end
})
