return {
    {
        'nvim-lualine/lualine.nvim', -- bar on the bottom of the screen
        commit = "b8c2315",
        dependencies = {
            'kyazdani42/nvim-web-devicons',
            commit = "c2599a8",
            lazy = true
        },
        config = function()
            require('lualine').setup {
                options = {
                    -- theme = 'dracula-nvim'
                    -- theme = 'onedark'
                    theme = 'catppuccin'
                }
            }
        end
    },
}
