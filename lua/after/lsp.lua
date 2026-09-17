vim.lsp.config("*", {
    root_markers = { ".git" },
})

local lspconfig = require('lspconfig')

-- -- glsl
-- lspconfig.glslls.setup {
--     cmd = { "glslls", "--stdin", "--target-env=opengl4.5" },
--     capabilities = lsp_capabilities,
--     on_attach = lsp_on_attach,
-- }
--

vim.lsp.config("clangd", {
    cmd = {"clangd", "--header-insertion=never"},
    filetypes = {"c", "cpp"},
})

-- vim.lsp.config("rust-analyzer", {
--     cmd = {"rust-analyzer"},
--     filetypes = {"rust"}
-- })

vim.lsp.enable("clangd")
vim.lsp.enable("lua-language-server")
-- vim.lsp.enable("rust-analyzer")

-- vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client ~= nil and client:supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, attach_opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, attach_opts)
vim.keymap.set("n", "<leader>rr", require("telescope.builtin").lsp_references, attach_opts)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, attach_opts)
vim.keymap.set('n', 'so', require('telescope.builtin').lsp_references, attach_opts)

-- Stop formatting on save
vim.g.zig_fmt_autosave = 0

-- Recognize wgsl
vim.api.nvim_command("autocmd BufNewFile,BufRead *.wgsl set filetype=wgsl")
