return {
	{
		"folke/neodev.nvim",
		dependencies = 'kyazdani42/nvim-web-devicons',
		config = function ()
			require('neodev').setup {}
		end
	},
}
