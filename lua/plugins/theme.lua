return {
    --'Mofiqul/dracula.nvim',
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.api.nvim_command('colorscheme catppuccin')
        end
    }
    --    {
    -- 	'navarasu/onedark.nvim', -- onedark theme
    -- 	config = function()
    -- 		require("onedark").setup({
    -- 		})
    --            vim.api.nvim_command('colorscheme onedark')
    -- 	end
    -- }
}
