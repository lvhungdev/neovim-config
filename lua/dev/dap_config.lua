local dap = require("dap")

dap.adapters.cppdbg = {
    id = "cppdbg",
    type = "executable",
    command = "C:/Users/lvhu/dev/sdk/cpptools/extension/debugAdapters/bin/OpenDebugAD7.exe",
    options = {
        detached = false
    }
}

dap.adapters.codelldb = {
    type = "server",
    port = "${port}",
    executable = {
        command = "C:/Users/lvhu/AppData/Local/nvim-data/mason/packages/codelldb/extension/adapter/codelldb.exe",
        args = { "--port", "${port}" },
        detached = false,
    }
}

dap.adapters.coreclr = {
    type = "executable",
    command = "C:/Users/lvhu/AppData/Local/nvim-data/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
    args = { "--interpreter=vscode" }
}

dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb",
        miDebuggerPath = "C:/msys64/mingw64/bin/gdb.exe",
        setupCommands = {
            {
                description = "Enable pretty-printing for gdb",
                text = "-enable-pretty-printing",
                ignoreFailures = true
            },
            {
                description = "Set Disassembly Flavor to Intel",
                text = "-gdb-set disassembly-flavor intel",
                ignoreFailures = true
            } },
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/build/", "file")
        end,
        cwd = "${workspaceFolder}/build/",
        stopOnEntry = false,
    },
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

dap.configurations.cs = {
    {
        type = "coreclr",
        name = "Launch",
        request = "launch",
        program = function()
            return vim.fn.input("Path to dll", vim.fn.getcwd() .. "/bin/Debug/", "file")
        end,
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
