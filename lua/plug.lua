-- plug.lua

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
    "folke/which-key.nvim",
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    {
        "folke/neodev.nvim",
        dependencies = 'kyazdani42/nvim-web-devicons',
    },
    'mhinz/vim-startify',            -- start screen
    -- 'DanilaMihailov/beacon.nvim',    -- cursor jump highlighting
    {
        'nvim-lualine/lualine.nvim', -- bar on the bottom of the screen
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            lazy = true
        },
    },
    --'Mofiqul/dracula.nvim',                      -- dracula theme
    'navarasu/onedark.nvim', -- onedark theme
    'mbbill/undotree',       -- undo tree view (<Leader> f5)
    "nvim-lua/plenary.nvim",
    {
        'nvim-telescope/telescope.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
    },
    'Yggdroot/indentLine',                 -- see line indents
    'numToStr/Comment.nvim',               -- "gc" to comment visual regions/lines

    'lewis6991/gitsigns.nvim',             -- Add git related info in the signs columns and popups

    'vimwiki/vimwiki',                     -- vim wiki!
    {
        'nvim-treesitter/nvim-treesitter', -- tree sitter and treee sitter update
        build = ':TSUpdate',
    },
    "neovim/nvim-lspconfig",
    {
        "williamboman/mason.nvim", -- :Mason to download lsps
        build = ":MasonUpdate"     -- :MasonUpdate updates registry contents
    },
    "williamboman/mason-lspconfig.nvim",
    {                               -- Autocompletion
        'hrsh7th/nvim-cmp',         -- Autocompletion plugin
        dependencies = {
            'hrsh7th/cmp-nvim-lsp', -- LSP source for nvim-cmp
            'hrsh7th/cmp-nvim-lua',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'L3MON4D3/LuaSnip',        -- Snippets plugin
            'saadparwaiz1/cmp_luasnip' -- source for nvim-cmp
        },
    },
    "theprimeagen/harpoon", -- file navigation
	"xiyaowong/transparent.nvim",
})
