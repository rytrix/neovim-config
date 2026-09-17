-- leader
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.localleader = " "

require("plug")
require("vars")
require("opts")
require("keys")
require("diagnostics")

-- Highlight trailing whitespace in red
-- vim.cmd("highlight ExtraWhitespace ctermbg=red guibg=red")
-- vim.cmd("match ExtraWhitespace /\\s\\+$/")

-- Automatically remove trailing whitespace before writing the buffer
-- vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])

-- vim.opt.grepprg = "rg --vimgrep --smart-case --hidden"
-- vim.opt.grepformat = "%f:%l:%c:%m"

-- vim.keymap.set("n", "<leader>g", function()
-- 	vim.ui.input({ prompt = "Grep: " }, function(pattern)
-- 		if pattern then
-- 			vim.cmd("silent grep! " .. vim.fn.fnameescape(pattern))
-- 			vim.cmd("copen")
-- 		end
-- 	end)
-- end, { silent = true })
