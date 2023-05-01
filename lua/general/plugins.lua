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
    { "Mofiqul/vscode.nvim",   lazy = true },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function() require("nvim-treesitter.configs").setup(require("ui/treesitter")) end,
    },
    { "lukas-reineke/indent-blankline.nvim" },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("lualine").setup({}) end,
    },
    {
        "echasnovski/mini.indentscope",
        version = "*",
        config = function() require("mini.indentscope").setup(require("ui/indent")) end,
        enabled = false
    },
    {
        "petertriho/nvim-scrollbar",
        config = function() require("scrollbar").setup(require("ui/scroll-bar")) end,
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
        "akinsho/bufferline.nvim",
        version = "v3.*",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function() require("bufferline").setup(require("navigation/buffer")) end,
    },
    { "kazhala/close-buffers.nvim" },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        dependencies = { "nvim-lua/plenary.nvim" },
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
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    {
        "lewis6991/gitsigns.nvim",
        config = function() require("gitsigns").setup(require("dev/git")) end,
    },
    { "akinsho/toggleterm.nvim" },
    {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup({}) end,
    },
    { "tpope/vim-commentary" },
    {
        "RRethy/vim-illuminate",
        config = function() require("illuminate").configure(require("dev/highlight")) end,
    },
    -- { "github/copilot.vim" },
})
