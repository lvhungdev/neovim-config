require("bufferline").setup({
    options = {
        mode = "buffers",
        max_name_length = 45,
        max_prefix_length = 15,
        tab_size = 20,
        diagnostics = "nvim_lsp",
        middle_mouse_command = "bdelete! %d",
        right_mouse_command = nil,
    }
})
