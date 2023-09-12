-- vim-illuminate
vim.api.nvim_set_hl(0, "IlluminatedWordText", { bg = "#223E55" })
vim.api.nvim_set_hl(0, "IlluminatedWordRead", { bg = "#223E55" })
vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { bg = "#223E55" })

-- Highligh when copy
vim.cmd [[
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=200}
augroup END
]]
