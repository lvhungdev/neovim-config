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

-- Temp fix for encoding between null-ls and clangd
local notify = vim.notify
vim.notify = function(msg, ...)
    if msg:match("warning: multiple different client offset_encodings") then
        return
    end

    notify(msg, ...)
end
