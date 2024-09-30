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
				vim.fn.jobstart({"qview", img})
			end,
		})
	end
}
