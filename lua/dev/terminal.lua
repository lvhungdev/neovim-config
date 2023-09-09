local term = require('toggleterm')

term.setup({
    open_mapping = [[<M-1>]]
})

---@diagnostic disable-next-line: lowercase-global
function _lazygit_toggle()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new {
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        on_open = function(_)
            vim.cmd "startinsert!"
        end,
        on_close = function(_) end,
        count = 99,
    }
    lazygit:toggle()
end

---@diagnostic disable-next-line: lowercase-global
function _terminal_two_toggle()
    local Terminal = require("toggleterm.terminal").Terminal
    local term_2 = Terminal:new {
        cmd = nil,
        hidden = true,
        direction = "horizontal",
        on_open = function(_)
            vim.cmd "startinsert!"
        end,
        on_close = function(_) end,
        count = 100,
    }
    term_2:toggle()
end

vim.keymap.set('n', '<leader>gu', '<cmd>lua _lazygit_toggle()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<M-2>', '<cmd>lua _terminal_two_toggle()<CR>', { noremap = true, silent = true })
