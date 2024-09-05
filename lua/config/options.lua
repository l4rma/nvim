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
set.list = true
set.listchars = {eol = '↵', space = '·', trail = '·', tab = '⋮·'}
set.conceallevel = 1

-- Set GUI Cursor: Block. Blinking in insert-mode. Underline in replace-mode and while operation pending
set.gcr = "n-v-c-sm-i-ci-ve:block,r-cr-o:hor20,i:blinkwait0-blinkoff400-blinkon250-Cursor/lCursor" 

-- Folding code
set.foldmethod = "expr"
set.foldexpr = "nvim_treesitter#foldexpr()"
set.foldenable = false

-- Colorscheme
vim.cmd("colorscheme catppuccin-frappe")
set.background = "dark" --'light' or 'dark'
--vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
--vim.cmd("hi NormalNC guibg=NONE ctermbg=NONE")
-- Telescope flutter extention
--require("telescope").load_extension("flutter")

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

-- Highlight yanked text
vim.cmd("au TextYankPost * silent! lua vim.highlight.on_yank {higroup=\"IncSearch\", timeout=150}")

-- Format file and set filetype to JSON
function format_json()
  vim.cmd("%! jq")
  vim.cmd("set ft=json")
end
vim.api.nvim_create_user_command('JSON', format_json, {})

function format_xml()
  vim.cmd("%!xmllint --format -")
  vim.cmd("set ft=xml")
end
vim.api.nvim_create_user_command('XML', format_xml, {})

-- Resize columns in PSV file
function psv_resize_columns()
  vim.cmd(":%s/||/| |/g")
  vim.cmd(":%s/||/| |/g")
  vim.cmd(":%! column -t -s \"|\"")
  vim.cmd(":split")
  vim.cmd("wincmd w")
  vim.cmd("resize 1")
  vim.cmd("wincmd w")
end
vim.api.nvim_create_user_command('FixPsv', psv_resize_columns, {})

-- Leader+enter toggles checkbox in markdown files
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
  pattern = {"*.md"},
  callback = function() 
    vim.api.nvim_set_keymap('n', '<leader><CR>', ':lua require("utils.toggle-checkbox").toggle()<CR>', { noremap = true })
  end
})

local function get_visual_selection()
    local s_start = vim.fn.getpos("'<")
    local s_end = vim.fn.getpos("'>")
    local n_lines = math.abs(s_end[2] - s_start[2]) + 1
    local lines = vim.api.nvim_buf_get_lines(0, s_start[2] - 1, s_end[2], false)
    lines[1] = string.sub(lines[1], s_start[3], -1)
    if n_lines == 1 then
        lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
    else
      lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
    end
    return table.concat(lines, '\n')
end
  
function OpenSelectedTextInSplit()
    local selected_text = get_visual_selection()
    local temp_file = vim.fn.tempname()

    -- Save the selected text to a temp file
    local file = io.open(temp_file, "w")
    file:write(selected_text)
    file:close()

    -- Open the temp file in a new split
    vim.cmd('vsplit ' .. temp_file)
end
