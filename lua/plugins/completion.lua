return {
    "hrsh7th/nvim-cmp",     -- Autocompletion plugin
    commit = "b5311ab",
    dependencies = {
        {
            "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
            commit = "bd5a7d6",
        },
        {
            "hrsh7th/cmp-nvim-lua",
            commit = "f12408b",
        },
        {
            "hrsh7th/cmp-buffer",
            commit = "b74fab3",
        },
        {
            "hrsh7th/cmp-path",
            commit = "c642487",
        },
        {
            "L3MON4D3/LuaSnip",     -- Snippets plugin
            tag = "v2.4.0",
        },
        {
            "saadparwaiz1/cmp_luasnip",     -- source for nvim-cmp
            commit = "98d9cb5",
        },
    },
}
