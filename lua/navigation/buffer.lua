-- This is for akinsho/bufferline.nvim
-- return {
--     options = {
--         mode = "buffers",
--         max_name_length = 45,
--         max_prefix_length = 15,
--         tab_size = 20,
--         diagnostics = "nvim_lsp",
--         middle_mouse_command = "bdelete! %d",
--         right_mouse_command = nil,
--     }
-- }


-- This is for romgrk/barbar.nvim
-- See default config at https://github.com/romgrk/barbar.nvim
return {
    animation = false,
    auto_hide = false,
    tabpages = false,
    clickable = true,
    focus_on_close = "left",
    highlight_visible = true,
    icons = {
        buffer_index = false,
        buffer_number = false,
        button = "",
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "E" },
            [vim.diagnostic.severity.WARN] = { enabled = true, icon = "W" },
            [vim.diagnostic.severity.INFO] = { enabled = true, icon = "I" },
            [vim.diagnostic.severity.HINT] = { enabled = true, icon = "H" },
        },
        gitsigns = {
            added = { enabled = false },
            changed = { enabled = false },
            deleted = { enabled = false },
        },
        filetype = {
            custom_colors = false,
            enabled = false,
        },
        separator = { left = "▎", right = "" },
        modified = { button = "●" },
        pinned = { button = "車", filename = true, separator = { right = "" } },
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = true },
        inactive = { button = "" },
        visible = { modified = { buffer_number = false } },
    },
    insert_at_end = false,
    insert_at_start = false,
    maximum_padding = 1,
    minimum_padding = 1,
    maximum_length = 45,
    semantic_letters = true,
    sidebar_filetypes = {
        NvimTree = true,
        undotree = { text = "undotree" },
        ["neo-tree"] = { event = "BufWipeout" },
        Outline = { event = "BufWinLeave", text = "symbols-outline" },
    },
    letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
}
