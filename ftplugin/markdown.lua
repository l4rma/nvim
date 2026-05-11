-- Helper to check if file exists and generate the ID
local function generate_smart_id(text)
    local client = require("obsidian").get_client()
    local date_part = os.date("%y%m%d")
    local clean_title = text:gsub("%s+", "-"):gsub("[^%w%-]", ""):lower()
    local base_id = date_part .. "-" .. clean_title
    
    -- 1. Search the vault for any file matching this ID
    -- This is the most reliable way as it ignores directory depth
    local search_results = client:find_notes(base_id)
    
    local exists = false
    for _, note in ipairs(search_results) do
        -- Check if the ID matches exactly to avoid partial matches
        if note.id == base_id or note.title == base_id then
            exists = true
            break
        end
    end

    if not exists then
        return base_id
    else
        -- 2. File EXISTS! Append random chars
        local charset = "abcdefghijklmnopqrstuvwxyz0123456789"
        local random_part = ""
        for i = 1, 4 do
            local r = math.random(#charset)
            random_part = random_part .. charset:sub(r, r)
        end
        return base_id .. "-" .. random_part
    end
end

-- NORMAL MODE: Link word
local function link_word_normal()
    local client = require("obsidian").get_client()
    local word = vim.fn.expand("<cword>")
    if word == "" then return end

    local new_id = generate_smart_id(word)
    client:create_note({ id = new_id, title = word, no_write = false })

    local link = string.format("[%s](./%s.md)", word, new_id)
    vim.cmd("normal! ciw" .. link)
end

-- VISUAL MODE: Link selection
local function link_selection_visual()
    local client = require("obsidian").get_client()
    vim.cmd('normal! "vy')
    local selection = vim.fn.getreg('v'):gsub("\n", " "):gsub("^%s*(.-)%s*$", "%1")
    if selection == "" then return end

    local new_id = generate_smart_id(selection)
    client:create_note({ id = new_id, title = selection, no_write = false })

    local link = string.format("[%s](./%s.md)", selection, new_id)
    vim.cmd("normal! gvc" .. link)
end

-- Keybindings
vim.keymap.set("n", "<leader>ol", link_word_normal, { buffer = true, desc = "Link word (Smart ID)" })
vim.keymap.set("v", "<leader>ol", link_selection_visual, { buffer = true, desc = "Link selection (Smart ID)" })
