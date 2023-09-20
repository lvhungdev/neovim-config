-- Catppuccin
-- return {
--     highlight_overrides = {
--         all = function(colors)
--             return {
--                 NvimTreeGitNew = { fg = colors.green },
--             }
--         end,
--     },
--     color_overrides = {
--         all = {
--         },
--     },
-- }

-- vscode
local colors = require("vscode.colors").get_colors()
return {
    color_overrides = {
        -- vscLineNumber = '#FFFFFF',
    },
    group_overrides = {
        Comment = { fg = colors.vscGray },
        SpecialComment = { fg = colors.vscGray },
        ['@comment'] = { fg = colors.vscGray },
    }
}
