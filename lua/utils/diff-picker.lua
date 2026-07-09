local M = {}

function M.diff_against_picked()
    local current_file = vim.fn.expand('%:p')
    if current_file == '' then
        vim.notify('No file open', vim.log.levels.WARN)
        return
    end
    local actions = require('telescope.actions')
    local action_state = require('telescope.actions.state')
    require('telescope.builtin').find_files({
        find_command = { 'rg', '--files', '--hidden', '-g', '!.git' },
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selected = action_state.get_selected_entry()
                if selected then
                    vim.cmd('vert diffsplit ' .. vim.fn.fnameescape(selected.path or selected.filename))
                end
            end)
            return true
        end,
    })
end

return M
