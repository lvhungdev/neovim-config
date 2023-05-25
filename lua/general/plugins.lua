local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- General
    {
        "echasnovski/mini.surround",
        version = "*",
        config = function() require("mini.surround").setup({}) end,
    },

    -- UI
    { "Mofiqul/vscode.nvim",    lazy = true },
    { "mcchrish/zenbones.nvim", lazy = true, dependencies = { "rktjmp/lush.nvim" } },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("nvim-treesitter.configs").setup(require("ui/treesitter")) end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        opts = require("ui/indentation")
    },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("ui/statusline") end,
    },
    {
        "petertriho/nvim-scrollbar",
        config = function() require("scrollbar").setup(require("ui/scroll_bar")) end,
    },
    {
        "stevearc/dressing.nvim",
        config = function() require("dressing").setup({}) end,
    },

    -- Navigation
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("nvim-tree").setup(require("navigation/file-tree")) end,
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        init = function() vim.g.barbar_auto_setup = false end,
        opts = require("navigation/buffer"),
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function() require("navigation/telescope_config") end,
    },

    -- Dev
    { "neovim/nvim-lspconfig" },
    {
        "williamboman/mason.nvim",
        config = function() require("mason").setup({}) end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function() require("mason-lspconfig").setup({}) end,
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
    },
    { "hrsh7th/nvim-cmp",                   commit = "d00d78fa3fea57755dfd7701745875f5a8062145" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = { "mfussenegger/nvim-dap" },
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup(require("dev/git")) end,
    },
    { "akinsho/toggleterm.nvim" },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup({}) end,
    },
    {
        "numToStr/Comment.nvim",
        config = function() require("Comment").setup({}) end,
    },
    {
        "RRethy/vim-illuminate",
        config = function() require("illuminate").configure(require("dev/highlight")) end,
    },
    -- { "github/copilot.vim" },
})
