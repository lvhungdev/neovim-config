-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   term_mode = "t",
--   command_mode = "c",

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

keymap("n", "gD", vim.lsp.buf.declaration, opts)
keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts)
keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "gi", ":Telescope lsp_implementations<CR>", opts)
keymap("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
keymap("n", "<leader>r", vim.lsp.buf.rename, opts)
keymap("n", "<leader>a", vim.lsp.buf.code_action, opts)
keymap("n", "gr", ":Telescope lsp_references<CR>", opts)
keymap("n", "<C-k>", vim.diagnostic.open_float, opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", "<leader>lg", vim.diagnostic.setloclist, opts)
keymap(
    "n",
    "<leader>lf",
    function()
        vim.lsp.buf.format { async = true }
    end,
    opts
)
keymap(
    "v",
    "<leader>lf",
    function()
        vim.lsp.buf.format {
            async = true,
            range = {
                ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
            }
        }
    end,
    opts
)
