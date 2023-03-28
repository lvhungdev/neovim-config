local dap = require("dap")

dap.adapters.coreclr = {
    type = "executable",
    -- command = "C:/Users/lvhu/AppData/Roaming/nvim-data/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
    command = os.getenv('HOME') .. "/AppData/Roaming/nvim-data/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
    args = { "--interpreter=vscode" }
}
dap.configurations.cs = {
    {
        type = "coreclr",
        request = "launch",
        name = "launch - netcoredbg",
        program = function()
            return vim.fn.input('program ', vim.fn.getcwd())
        end,
        cwd = function()
            return vim.fn.input('cwd ', vim.fn.getcwd())
        end,
        env = {
            ASPNETCORE_ENVIRONMENT = "Development"
        }
    }
}

-- DAP UI --
local dapui = require("dapui")
dapui.setup({
    layout = { position = "right" }
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
