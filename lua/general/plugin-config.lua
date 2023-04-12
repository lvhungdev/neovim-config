local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the general/plugin-config.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost general/plugin-config.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- Utils
    use "nvim-lua/plenary.nvim"

    -- General
    use "lewis6991/gitsigns.nvim"
    use "akinsho/toggleterm.nvim"

    -- Lsp
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "mfussenegger/nvim-dap"
    use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
    use "jose-elias-alvarez/null-ls.nvim"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "saadparwaiz1/cmp_luasnip"
    use "L3MON4D3/LuaSnip"
    use "windwp/nvim-autopairs"
    use "lukas-reineke/indent-blankline.nvim"
    use "tpope/vim-commentary"

    -- UI
    use "navarasu/onedark.nvim"
    use "folke/tokyonight.nvim"
    use { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons" }, }
    use "petertriho/nvim-scrollbar"

    -- Navigation
    use "nvim-tree/nvim-tree.lua"
    use { "akinsho/bufferline.nvim", tag = "v3.*", requires = "nvim-tree/nvim-web-devicons" }
    use "kazhala/close-buffers.nvim"
    use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
    use { "nvim-telescope/telescope.nvim", branch = "0.1.x" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
