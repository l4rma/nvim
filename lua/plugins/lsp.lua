-- LSP
-- Setup language servers.
local lspconfig = require('lspconfig')
lspconfig.lua_ls.setup {}
-- typescript
lspconfig.tsserver.setup({
    filetypes = {
        "typescript",
    },
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
})
lspconfig.jdtls.setup{}
lspconfig.rust_analyzer.setup{}

