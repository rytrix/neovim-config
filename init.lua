-- init.lua

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

vim.lsp.config('*', {
    root_markers = { '.git' },
})

vim.lsp.config('clangd', {
    cmd = {'clangd', '--header-insertion=never'},
    filetypes = {'c', 'c++'},
})

vim.lsp.enable('clangd')

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "LSP go to definition"})
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {desc = "LSP go to declaration"})
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
vim.keymap.set('n', '<leader>rr', require('telescope.builtin').lsp_references, attach_opts)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Highlight trailing whitespace in red
-- vim.cmd('highlight ExtraWhitespace ctermbg=red guibg=red')
-- vim.cmd('match ExtraWhitespace /\\s\\+$/')

-- Automatically remove trailing whitespace before writing the buffer
-- vim.cmd([[autocmd BufWritePre * %s/\s\+$//e]])
