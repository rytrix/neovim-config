vim.lsp.config("*", {
    root_markers = { ".git" },
})

vim.lsp.config("clangd", {
    cmd = {"clangd", "--header-insertion=never"},
    filetypes = {"c", "cpp"},
})

vim.lsp.config("rust-analyzer", {
    cmd = {"rust-analyzer"},
    filetypes = {"rust"}
})

vim.lsp.config("wgsl-analyzer", {
    cmd = {"wgsl-analyzer"},
    filetypes = {"wgsl"}
})

vim.lsp.enable("clangd")
vim.lsp.enable("lua_ls")
vim.lsp.enable("rust-analyzer")
-- vim.lsp.enable("wgsl-analyzer")
vim.lsp.enable("ols")

-- vim.diagnostic.config({ virtual_text = true })

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(ev)
-- 		local client = vim.lsp.get_client_by_id(ev.data.client_id)
-- 		if client ~= nil and client:supports_method("textDocument/completion") then
-- 			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
-- 		end
-- 	end,
-- })

vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP go to definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, attach_opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, attach_opts)
vim.keymap.set("n", "<leader>rr", require("telescope.builtin").lsp_references, attach_opts)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, attach_opts)

-- Stop formatting on save
vim.g.zig_fmt_autosave = 0

-- Recognize wgsl
vim.api.nvim_command("autocmd BufNewFile,BufRead *.wgsl set filetype=wgsl")
