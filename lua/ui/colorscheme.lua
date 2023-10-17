-- vscode
-- local colors = require("vscode.colors").get_colors()
-- return {
--     color_overrides = {
--         -- vscLineNumber = '#FFFFFF',
--     },
--     group_overrides = {
--         Comment = { fg = colors.vscGray },
--         SpecialComment = { fg = colors.vscGray },
--         ['@comment'] = { fg = colors.vscGray },
--     }
-- }

-- bamboo
return {
    -- style = 'multiplex',
    highlights = {
        Comment             = { fg = '$grey' },
        SpecialComment      = { fg = '$grey' },
        ['@comment']        = { fg = '$grey' },
        NormalFloat         = { bg = '#1c1e1b' },
        -- NvimTreeFolderName       = { fg = '#f1e9d2' },
        -- NvimTreeOpenedFolderName = { fg = '#f1e9d2' },
        NvimTreeVertSplit   = { bg = '$grey' },
        ['@parameter']      = { fmt = 'none' },
    },
    code_style = {
        conditionals = 'none',
    },
}
