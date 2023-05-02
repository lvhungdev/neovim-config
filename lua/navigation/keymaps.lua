-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>q", ":BufferClose<cr>", opts)

keymap('n', '<leader>f', ":Telescope find_files<cr>", {})
keymap('n', '<leader>s', ":Telescope live_grep<cr>", {})
keymap('n', '<leader>d', ":Telescope diagnostics<cr>", {})
