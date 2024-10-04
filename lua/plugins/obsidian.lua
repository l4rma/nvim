return {
	"epwalsh/obsidian.nvim",
	version = "*",  -- recommended, use latest release instead of latest commit
	lazy = false,
	ft = "markdown",
	dependencies = {"nvim-lua/plenary.nvim"},
	config = function()
		require("obsidian").setup({
		    workspaces = {
				{
				  name = "vault",
				  path = "~/Dropbox/vault"
				},
				{
				  name = "personal",
				  path = "~/Dropbox/vault/personal",
				},
				{
				  name = "work",
				  path = "~/Dropbox/vault/work",
				},
				{
				  name = "soprasteria",
				  path = "~/Dropbox/vault/work/soprasteria",
				},
			},
			completion = {
				-- Set to false to disable completion.
				nvim_cmp = true,
				-- Trigger completion at 2 chars.
				min_chars = 2,
			},
			templates = {
				folder = "templates",
				date_format = "%Y-%m-%d",
				time_format = "%H:%M",
				-- A map for custom variables, the key should be the variable and the value a function
				substitutions = {
					yesterday = function()
						return os.date("%Y-%m-%d", os.time() - 86400)
					end
				},
			},
			notes_subdir = "inbox",
			new_notes_location = "notes_subdir",
			note_id_func = function(title)
				local suffix = ""
				if title ~= nil then
					-- If title is given, transform it into valid file name.
					suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
				else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
					for _ = 1, 4 do
						suffix = suffix .. string.char(math.random(65, 90))
					end
				end
				return tostring(os.date("%y%m%d")) .. "-" .. suffix
			end,
			note_path_func = function(spec)
				-- This is equivalent to the default behavior.
				local path = spec.dir / tostring(spec.id)
				return path:with_suffix(".md")
			end,
			note_frontmatter_func = function(note)
				-- Add the title of the note as an alias.
				if note.title then
				  note:add_alias(note.title)
				end
				note.date = os.date("%d-%m-%y %A")
				note.sources = {}
				local out = { id = note.id, date = note.date, tags = note.tags, sources = note.sources }
				-- `note.metadata` contains any manually added fields in the frontmatter.
				-- So here we just make sure those fields are kept in the frontmatter.
				if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				  for k, v in pairs(note.metadata) do
				    out[k] = v
				  end
				end
				return out
			end,
			follow_url_func = function(url)
				vim.fn.jobstart({"xdg-open", url})  -- linux
			end,
			follow_img_func = function(img)
				vim.print("Hello world. Img: " .. img)
				--vim.cmd(":!qview " .. img)
			end,
			ui = {
				checkboxes = {
					-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
					[" "] = { char = "🔳 ", hl_group = "ObsidianTodo" },
					["x"] = { char = "✅ ", hl_group = "ObsidianDone" },
					[">"] = { char = "  ", hl_group = "ObsidianRightArrow" },
					["~"] = { char = "󰰱  ", hl_group = "ObsidianTilde" },
					["!"] = { char = "⚠  ", hl_group = "ObsidianImportant" },
				},
				bullets = { char = "• ", hl_group = "ObsidianBullet" },
				external_link_icon = { char = " ", hl_group = "ObsidianExtLinkIcon" },
				hl_groups = {
				  -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
    			  ObsidianTodo = { bold = true, fg = "#f78c6c" },
    			  ObsidianDone = { bold = true, fg = "#89ddff" },
    			  ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
    			  ObsidianTilde = { bold = true, fg = "#ff5370" },
    			  ObsidianImportant = { bold = true, fg = "#d73128" },
    			  ObsidianBullet = { bold = true, fg = "#D3C6AA" },
    			  ObsidianRefText = { underline = true, fg = "#c792ea" },
    			  ObsidianExtLinkIcon = { fg = "#c792ea" },
    			  ObsidianTag = { italic = true, fg = "#89ddff" },
    			  ObsidianBlockID = { italic = true, fg = "#89ddff" },
    			  ObsidianHighlightText = { bg = "#75662e" },
    			},
			},
		})
	end
}
