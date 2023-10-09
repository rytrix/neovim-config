-- init.lua

--faster startup?
--vim.loader.enable()

-- LEADER
-- These keybindings need to be defined before the first /
-- is called; otherwise, it will default to "\"
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.localleader = ' '

-- IMPORTS
require('plug') -- Plugins
require('vars') -- Variables
require('opts') -- Options
require('keys') -- Keymaps

-- Highlight trailing whitespace in red
-- vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
-- vim.cmd('match ExtraWhitespace /\\s\\+$/')

-- Automatically remove trailing whitespace before writing the buffer
-- vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
