return {
	{
		"theprimeagen/harpoon", -- file navigation
		lazy = true,
		keys = { "<C-e>", "<C-e>", "<C-1>", "<C-2>",
			"<C-3>", "<C-4>", "<C-5>", "<C-6>",
			"<C-7>", "<C-8>", "<C-9>", "<C-0>", },
		config = function()
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")

			vim.keymap.set("n", "<C-a>", mark.add_file)
			vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

			vim.keymap.set("n", "<C-1>", function() ui.nav_file(1) end)
			vim.keymap.set("n", "<C-2>", function() ui.nav_file(2) end)
			vim.keymap.set("n", "<C-3>", function() ui.nav_file(3) end)
			vim.keymap.set("n", "<C-4>", function() ui.nav_file(4) end)
			vim.keymap.set("n", "<C-5>", function() ui.nav_file(5) end)
			vim.keymap.set("n", "<C-6>", function() ui.nav_file(6) end)
			vim.keymap.set("n", "<C-7>", function() ui.nav_file(7) end)
			vim.keymap.set("n", "<C-8>", function() ui.nav_file(8) end)
			vim.keymap.set("n", "<C-9>", function() ui.nav_file(9) end)
			vim.keymap.set("n", "<C-0>", function() ui.nav_file(10) end)
		end
	}
}
