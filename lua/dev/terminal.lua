local term = require('toggleterm')

term.setup({
    open_mapping = [[<M-1>]]
})

local Terminal = require('toggleterm.terminal').Terminal

local lazygit  = Terminal:new({ cmd = 'lazygit', hidden = true, direction = 'float' })

---@diagnostic disable-next-line: lowercase-global
function _lazygit_toggle()
    lazygit:toggle()
end

vim.keymap.set('n', '<leader>gu', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })

local normal = Terminal:new({})

---@diagnostic disable-next-line: lowercase-global
function _normal_terminal_toggle()
    normal:toggle()
end

vim.keymap.set('n', '<leader>tb', '<cmd>lua _normal_terminal_toggle()<CR>', { noremap = true, silent = true })
