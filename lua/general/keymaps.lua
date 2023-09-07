-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   term_mode = "t",
--   command_mode = "c",

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- keymap("n", "U", "<C-r>", opts)
-- keymap("n", "gh", "0", opts)
-- keymap("n", "gl", "$", opts)
-- keymap("n", "ge", "<S-g>", opts)
-- keymap("v", "gh", "0", opts)
-- keymap("v", "gl", "$", opts)
-- keymap("v", "ge", "<S-g>", opts)

-- Better copy and paste
keymap("n", "c", '"_c', opts)
keymap("n", "C", '"_C', opts)
keymap("n", "d", '"_d', opts)
keymap("n", "D", '"_D', opts)
keymap("n", "dd", '"_dd', opts)
keymap("v", "d", '"_d', opts)
keymap("v", "p", '"_dP', opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Better buffer navigation
keymap("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<S-Right>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<S-Left>", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<leader>q", ":BufDel<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<ESC>", ":noh<CR>", opts)

-- Stay in indent mode
keymap("n", "<", "<gv", opts)
keymap("n", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("n", "<A-j>", ":m .+1<CR>==", opts)
keymap("n", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--- Git
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)
keymap("n", "<leader>gb", ":Gitsigns blame_line<CR>", opts)
keymap("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", opts)
keymap("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", opts)

-- Comment
keymap("n", "<leader>/", "gcc", { remap = true })
keymap("v", "<leader>/", "gc", { remap = true })

-- Terminal
keymap("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { noremap = true })
keymap("t", "<C-x>", "<C-\\><C-n>", { noremap = true })
