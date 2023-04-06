local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup({})

lspconfig.tsserver.setup({})

lspconfig.dartls.setup({
    settings = {
        dart = {
            lineLength = 120
        }
    }
})

lspconfig.omnisharp.setup({
    cmd = { "dotnet", "C:/Users/lvhu/AppData/Roaming/nvim-data/mason/packages/omnisharp/OmniSharp.dll" },
    enable_editorconfig_support = true,
    enable_ms_build_load_projects_on_demand = false,
    enable_roslyn_analyzers = false,
    organize_imports_on_format = false,
    enable_import_completion = false,
    sdk_include_prereleases = true,
    analyze_open_documents_only = false,
})

lspconfig.intelephense.setup({})

lspconfig.rust_analyzer.setup({
    cmd = { "C:/Users/lvhu/AppData/Local/nvim-data/mason/packages/rust-analyzer/rust-analyzer" }
})
