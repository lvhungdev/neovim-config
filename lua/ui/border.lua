vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = 'rounded' }
)

vim.diagnostic.config({
    float = {
        border = 'rounded',
    },
})
