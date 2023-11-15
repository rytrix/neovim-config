-- opts.lua
local opt = vim.opt
local cmd = vim.api.nvim_command

-- context
-- opt.colorcolumn = '80'        -- str:  Show col for max line length
opt.number = true                -- bool: Show line numbers
opt.relativenumber = true        -- bool: Show relative line numbers
opt.scrolloff = 4                -- int:  Min num lines of context
--opt.signcolumn = "yes"         -- str:  Show the sign column
vim.o.mouse = 'a'                -- Enable mouse mode
vim.o.breakindent = false        -- Enable break indent
-- vim.opt.guicursor = ""			 -- cursor?

vim.o.updatetime = 250           -- Decrease update time
vim.o.completeopt = 'menuone,noselect' -- Set completeopt to have a better completion experience

vim.opt.undofile = true			 -- Enable persistent undo

-- opt.clipboard = "unnamedplus"    -- Use the system clipboard

-- filetypes
opt.encoding = 'utf8'            -- str:  String encoding to use
opt.fileencoding = 'utf8'        -- str:  File encoding to use

-- theme
opt.syntax = "ON"                -- str:  Allow syntax highlighting
opt.termguicolors = true         -- bool: If term supports ui color then enable
-- cmd('colorscheme onedark')
-- cmd('colorscheme dracula')
cmd('colorscheme catppuccin')

-- search
opt.ignorecase = true            -- bool: Ignore case in search patterns
opt.smartcase = true             -- bool: Override ignorecase if search contains capitals
opt.incsearch = true             -- bool: Use incremental search
opt.hlsearch = false             -- bool: Highlight search matches

-- whitespace
opt.expandtab = false             -- bool: Use spaces instead of tabs
opt.shiftwidth = 4               -- num:  Size of an indent
opt.softtabstop = 4              -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4                  -- num:  Number of spaces tabs count for

-- splits
opt.splitright = true            -- bool: Place new window to right of current one
opt.splitbelow = true            -- bool: Place new window below the current one

-- settings for vimwiki
-- Disable compatibility with vi
opt.compatible = false
-- Enable filetype detection and plugins
vim.cmd('filetype plugin on')
-- Enable syntax highlighting
vim.cmd('syntax on')


