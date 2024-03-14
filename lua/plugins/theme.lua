return {
	--'Mofiqul/dracula.nvim',                      -- dracula theme
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
	-- 			-- transparent = vim.g.transparent_enabled
	-- 		})
 --            vim.api.nvim_command('colorscheme onedark')
	-- 	end
	-- }
}
