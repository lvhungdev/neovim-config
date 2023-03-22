local dap = require("dap")

dap.adapters.coreclr = {
    type = "executable",
    command = "C:/Users/lvhu/AppData/Roaming/nvim-data/mason/packages/netcoredbg/netcoredbg/netcoredbg.exe",
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
    },
}
