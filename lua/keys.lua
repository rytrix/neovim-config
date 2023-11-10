-- keys.lua
local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

-- remap the key used to leave insert mode
-- map('i', 'jk', '', {})
-- mode sequence command options

-- map('n', 'l', ':IndentLinesToggle<CR>', {})
set('n', '<leader>;', vim.cmd.IndentLinesToggle, {})

local builtin = require('telescope.builtin')
set('n', '<leader>pf', builtin.find_files, {})
set('n', '<leader>pg', builtin.live_grep, {})
set('n', '<leader>pb', builtin.buffers, {})
set('n', '<leader>ph', builtin.help_tags, {})

set('n', '<leader>u', vim.cmd.UndotreeToggle, {})

-- Map `j` to move up
-- map("n", "j", "k", {noremap = true})
-- map("v", "j", "k", {noremap = true})
-- -- Map `k` to move down
-- map("n", "k", "j", {noremap = true})
-- map("v", "k", "j", {noremap = true})

-- Remap Ctrl+w+j to move to the window below
-- map('n', '<C-w>j', '<C-w><Down>', { noremap = true })
-- -- Remap Ctrl+w+k to move to the window above
-- map('n', '<C-w>k', '<C-w><Up>', { noremap = true })

--Remap for dealing with word wrap
-- set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

map("n", "<C-Shift-C>", ":yank<CR>", { noremap = true }) -- yank

-- for moving text up and down in visual mode (auto indents too)
set("v", "K", ":m '<-2<CR>gv=gv")
set("v", "J", ":m '>+1<CR>gv=gv")

-- set("n", "J", "mzJ`z") -- J stays in place

-- half page jumping, keeps cursor in the center
set({ "n", "v" }, "<C-k>", "<C-u>zz")
set({ "n", "v" }, "<C-j>", "<C-d>zz")
set({ "n", "v" }, "<leader>k", "<C-u>zz")
set({ "n", "v" }, "<leader>j", "<C-d>zz")

-- keep cursor in the middle when going through searches
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")

-- paste without copying
set("x", "<leader>p", [["_dP]])

-- delete without copying
set({ "n", "v" }, "<leader>d", [["_d]])

-- copy into system clipboard instead of vim clipboard
set({ "n", "v" }, "<leader>y", [["+y]])
set("n", "<leader>Y", [["+Y]])

set("n", "Q", "<nop>") -- prime told me to do this idk why

set("n", "<leader>f", vim.lsp.buf.format)

-- quicklist navigation -- no idea what this does other than spit out errors
-- set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search on current word
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make current file executable
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

set({ "n", "v" }, "<C-h>", "^", { noremap = true })
set({ "n", "v" }, "<C-l>", "<End>", { noremap = true })

set("n", "<leader>h", "<Home>", { noremap = true })
set("n", "<leader>l", "<End>", { noremap = true })

vim.api.nvim_command("command! W :w")
vim.api.nvim_command("command! Wq :wq")


