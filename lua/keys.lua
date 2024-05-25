-- keys.lua
local map = vim.api.nvim_set_keymap
local set = vim.keymap.set

-- map('n', 'l', ':IndentLinesToggle<CR>', {})
-- set('n', '<leader>;', vim.cmd.IndentLinesToggle, {})

--Remap for dealing with word wrap
set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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

-- search on current word
set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make current file executable
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

set({ "n", "v" }, "<C-h>", "^", { noremap = true })
set({ "n", "v" }, "<C-l>", "$", { noremap = true })

set("n", "<leader>e", "<cmd>Ex<CR>", { silent = true })

-- I accidently do :W so much
vim.api.nvim_command("command! W :w")
vim.api.nvim_command("command! Wq :wq")
