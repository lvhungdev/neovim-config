-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   term_mode = "t",
--   command_mode = "c",

local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

keymap("n", "K", vim.lsp.buf.hover, opts)
keymap("n", "J", vim.diagnostic.open_float, opts)
keymap("n", "gD", vim.lsp.buf.declaration, opts)
keymap("n", "gd", ":Telescope lsp_definitions<CR>", opts)
keymap("n", "gi", ":Telescope lsp_implementations<CR>", opts)
keymap("n", "gr", ":Telescope lsp_references<CR>", opts)
keymap("n", "[d", vim.diagnostic.goto_prev, opts)
keymap("n", "]d", vim.diagnostic.goto_next, opts)
keymap("n", "<leader>ls", vim.lsp.buf.signature_help, opts)
keymap("n", "<leader>D", vim.lsp.buf.type_definition, opts)
keymap("n", "<leader>r", vim.lsp.buf.rename, opts)
keymap("n", "<leader>a", vim.lsp.buf.code_action, opts)
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

local dap = require("dap")
keymap('n', '<F5>', function() dap.continue() end)
keymap('n', '<F10>', function() dap.step_over() end)
keymap('n', '<F11>', function() dap.step_into() end)
keymap('n', '<F12>', function() dap.step_out() end)
keymap('n', '<Leader>db', function() dap.toggle_breakpoint() end)
keymap('n', '<Leader>du', function() require('dapui').toggle() end)
