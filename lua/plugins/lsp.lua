return {
    'neovim/nvim-lspconfig',
    config = function()
        vim.diagnostic.config({
            virtual_text = true,
            signs = true,
            underline = true,
            update_in_insert = false,
            float = { border = "rounded" },
        })

        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp_keybindings', { clear = true }),
            callback = function(ev)
                local buf = ev.buf
                local function map(key, fn, desc)
                    vim.keymap.set('n', key, fn, { buffer = buf, noremap = true, desc = desc })
                end
                map('gd',    vim.lsp.buf.definition,       'Go to definition')
                map('gD',    vim.lsp.buf.declaration,      'Go to declaration')
                map('gi',    vim.lsp.buf.implementation,   'Go to implementation')
                map('gw',    vim.lsp.buf.document_symbol,  'Document symbols')
                map('gW',    vim.lsp.buf.workspace_symbol, 'Workspace symbols')
                map('gr',    vim.lsp.buf.references,       'References')
                map('gR',    vim.lsp.buf.rename,           'Rename')
                map('gt',    vim.lsp.buf.type_definition,  'Type definition')
                map('ge',    vim.diagnostic.open_float,    'Show diagnostics')
                map('K',     vim.lsp.buf.hover,            'Hover')
                map('<a-cr>', vim.lsp.buf.code_action,     'Code action')
            end,
        })

        vim.lsp.enable("gopls")
    end,
}
