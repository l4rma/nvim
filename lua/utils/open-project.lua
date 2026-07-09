local M = {}

M.open_project = function()
    local project_root = vim.fn.expand("~/git/")

    local dirs = {}
    for name, type in vim.fs.dir(project_root) do
        if type == "directory" then
            table.insert(dirs, name)
        end
    end
    table.sort(dirs)

    require("telescope.pickers").new({}, {
        prompt_title = "Projects",
        finder = require("telescope.finders").new_table({
            results = dirs,
        }),
        sorter = require("telescope.config").values.generic_sorter({}),
        attach_mappings = function(prompt_bufnr)
            require("telescope.actions").select_default:replace(function()
                require("telescope.actions").close(prompt_bufnr)
                local selection = require("telescope.actions.state").get_selected_entry()
                if selection then
                    local project_path = project_root .. selection[1]

                    vim.cmd("cd " .. vim.fn.fnameescape(project_path))
                    vim.cmd("enew")

                    require("nvim-tree.api").tree.open()
                    require("nvim-tree.api").tree.change_root(project_path)
                end
            end)
            return true
        end,
    }):find()
end

return M
