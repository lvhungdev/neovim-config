local dap = require("dap")

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = "/home/lvhu/.local/share/nvim/mason/packages/codelldb/codelldb",
        args = { "--port", "${port}" },
        -- On windows you may have to uncomment this:
        -- detached = false,
    }
}

dap.configurations.rust = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
    },
}

-- DAP UI
local dapui = require("dapui")

dapui.setup({
    controls = {
        element = "repl",
        enabled = true,
        icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = ""
        }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
        border = "single",
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    force_buffers = true,
    icons = {
        collapsed = "",
        current_frame = "",
        expanded = ""
    },
    layouts = {
        {
            elements = {
                {
                    id = "scopes",
                    size = 0.50
                },
                {
                    id = "watches",
                    size = 0.3
                },
                {
                    id = "breakpoints",
                    size = 0.1
                },
                {
                    id = "stacks",
                    size = 0.1
                },
            },
            position = "left",
            size = 60
        },
        {
            elements = {
                {
                    id = "repl",
                    size = 0.4
                },
                {
                    id = "console",
                    size = 0.6
                }
            },
            position = "bottom",
            size = 12
        }
    },
    mappings = {
        edit = "e",
        expand = { "o", "<2-LeftMouse>" },
        open = "<CR>",
        remove = "d",
        repl = "r",
        toggle = "t"
    },
})

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
