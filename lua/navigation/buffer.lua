return {
    options = {
        always_show_bufferline = true,
        max_name_length = 30,
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                text_align = "center",
                separator = true,
            }
        },
        sort_by = "insert_after_current",
        persist_buffer_sort = false,
        indicator = {
            style = 'none'
        },
    },
    highlights = {
        buffer_selected = { italic = false },
        diagnostic_selected = { italic = false },
        hint_selected = { italic = false },
        pick_selected = { italic = false },
        pick_visible = { italic = false },
        pick = { italic = false },
        offset_separator = { bg = '#1c1e1b' },
    },
}
