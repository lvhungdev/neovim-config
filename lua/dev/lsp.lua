local lspconfig = require('lspconfig')

lspconfig.lua_ls.setup({})

lspconfig.intelephense.setup({})

lspconfig.dartls.setup({
    settings = {
        dart = {
            lineLength = 120
        }
    }
})

lspconfig.rust_analyzer.setup({})

lspconfig.tsserver.setup({})

lspconfig.clangd.setup({})
