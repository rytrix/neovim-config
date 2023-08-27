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
require('plug')        -- Plugins
require('vars')        -- Variables
require('opts')        -- Options
require('keys')        -- Keymaps

