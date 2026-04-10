vim.pack.add({
    {
        src = "https://github.com/nvim-lualine/lualine.nvim",
        name = "lualine",
        version = "b8c2315"
    },
    {
        src = "https://github.com/kyazdani42/nvim-web-devicons",
        name = "nvim-web-devicons",
        version = "c2599a8"
    }
})

require('lualine').setup {
    -- options = {
    --     -- These don't seem to work
    --     -- theme = "dracula-nvim"
    --     -- theme = "onedark"
    --     -- theme = "catppuccin"
    -- }
}
