require("bufferline").setup({
  options = {
    mode = "buffers",
    max_name_length = 20,
    max_prefix_length = 5,
    tab_size = 20,
    diagnostics = "nvim_lsp",
    middle_mouse_command = "bdelete! %d",
    right_mouse_command = nil,
  }
})
