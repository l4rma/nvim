local M = {}

M.yaml_view = function()
    if vim.env.NVIM_YAML_VIEW == "1" then
        vim.bo.filetype = "yaml"
        vim.keymap.set("n", "<leader>q", ":q!<CR>", { buffer = true, silent = true })
    end
end

return M
