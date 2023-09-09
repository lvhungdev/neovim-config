if vim.loop.os_uname().sysname == "Windows_NT" then
    -- Enable powershell as your default shell
    vim.opt.shell = "pwsh.exe -NoLogo"
    vim.opt.shellcmdflag =
    "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.cmd [[
        let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
        let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
        set shellquote= shellxquote=
        ]]
end

require "general"
require "ui"
require "navigation"
require "dev"
