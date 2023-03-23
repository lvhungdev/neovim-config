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

-- KEY MAPS --
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>dU", dapui.toggle, opts)
vim.keymap.set("n", "<leader>ds", dap.continue, opts)
vim.keymap.set("n", "<leader>dS", dap.terminate, opts)
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, opts)
