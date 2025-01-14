return {
    filters = {
        dotfiles = false,
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    update_focused_file = {
        enable = true,
        update_root = false,
    },
    view = {
        adaptive_size = false,
        side = "right",
        width = 40,
    },
    git = {
        enable = true,
        timeout = 2500,
        -- ignore = true,
    },
    filesystem_watchers = {
        enable = true,
    },
    actions = {
        open_file = {
            resize_window = true,
        },
    },
    diagnostics = {
        enable = true
    },
    renderer = {
        highlight_git = true,
        highlight_opened_files = "none",
        indent_markers = {
            enable = false,
        },
        full_name = true,
        special_files = {},
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                -- folder = {
                --     default = "",
                --     empty = "",
                --     empty_open = "",
                --     open = "",
                --     symlink = "",
                --     symlink_open = "",
                --     arrow_open = "",
                --     arrow_closed = "",
                -- },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
    },
}
