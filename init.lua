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

-- Highlight trailing whitespace in red
-- vim.cmd("highlight ExtraWhitespace ctermbg=red guibg=red")
-- vim.cmd("match ExtraWhitespace /\\s\\+$/")

-- Automatically remove trailing whitespace before writing the buffer
-- vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
