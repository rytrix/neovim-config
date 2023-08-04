-- plug_setup.lua

require('Comment').setup()

require('lualine').setup {
	options = {
		-- theme = 'dracula-nvim'
		theme = 'onedark'
	}
}

-- Gitsigns
require('gitsigns').setup {
	signs = {
		add = { text = '+' },
		change = { text = '~' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
	},
	on_attach = function(bufnr)
		vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr })
		vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr })
	end,
}

require 'nvim-treesitter.configs'.setup {
	-- A list of parser names, or "all" (the five listed parsers should always be installed)
	ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },

	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Automatically install missing parsers when entering buffer
	-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
	auto_install = true,
	-- List of parsers to ignore installing (for "all")
	ignore_install = {},
	---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
	-- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

	highlight = {
		enable = true,
		-- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
		-- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
		-- the name of the parser)
		-- list of language that will be disabled
		-- disable = { "latex" },
		-- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
		disable = function(lang, buf)
			if lang == "latex" then
				return true
			end
			local max_filesize = 100 * 1024 -- 100 KB
			local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
			if ok and stats and stats.size > max_filesize then
				return true
			end
		end,

		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},
	modules = {},
}

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		-- Create your keybindings here...
	end
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		-- Replace these with whatever servers you want to install
		'rust_analyzer',
		'clangd',
		'wgsl_analyzer'
	}
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
-- require("lspconfig").lua_ls.setup {}
-- require("lspconfig").rust_analyzer.setup {}
-- ...
-- Add nvim-lspconfig plugin
local lspconfig = require('lspconfig')
local lsp_on_attach = function(_, bufnr)
	local attach_opts = { silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
	vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
	vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
		attach_opts)
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
	vim.keymap.set('n', 'so', require('telescope.builtin').lsp_references, attach_opts)
	vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, attach_opts)
	vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
end

-- nvim-cmp supports additional completion capabilities
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(lsp_capabilities)
-- local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

-- require('mason-lspconfig').setup_handlers({
--     function(server_name)
--         lspconfig[server_name].setup({
--             capabilities = lsp_capabilities,
--             on_attach = lsp_on_attach,
--         })
--     end,
-- })

-- if servers are not working try this:
local get_servers = require('mason-lspconfig').get_installed_servers
-- Enable the following language servers
for _, server_name in ipairs(get_servers()) do
	if server_name == "wgsl_analyzer" then
		lspconfig[server_name].setup({
			capabilities = lsp_capabilities,
			on_attach = lsp_on_attach,
			filetypes = { "wgsl" }
		})
	else
		lspconfig[server_name].setup({
			capabilities = lsp_capabilities,
			on_attach = lsp_on_attach,
		})
	end
end

-- Recognize wgsl -- weird plugin
vim.api.nvim_command("autocmd BufNewFile,BufRead *.wgsl set filetype=wgsl")

require('neodev').setup {}

lspconfig.lua_ls.setup {
	on_attach = lsp_on_attach,
	capabilities = lsp_capabilities,
	settings = {
		Lua = {
			completion = {
				callSnippet = 'Replace',
			},
		},
	},
}

-- nvim-cmp setup
local cmp = require('cmp')
local luasnip = require('luasnip')

luasnip.config.setup {}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
	},
}

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

require("transparent").setup({
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLineNr', 'EndOfBuffer',
  },
  extra_groups = {}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})

require("onedark").setup({
	transparent = vim.g.transparent_enabled
})





