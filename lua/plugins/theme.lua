return {
	--'Mofiqul/dracula.nvim',                      -- dracula theme
	{
		'navarasu/onedark.nvim', -- onedark theme
		config = function()
			require("onedark").setup({
				transparent = vim.g.transparent_enabled
			})
		end
	}
}
