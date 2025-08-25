vim.lsp.config("*", {
    root_markers = { ".git" },
})

-- vim.lsp.config("clangd", {
--     cmd = {"clangd", "--header-insertion=never"},
--     filetypes = {"c", "c++"},
-- })

-- vim.lsp.config("rust-analyzer", {
--     cmd = {"rust-analyzer"},
--     filetypes = {"rust"}
-- })

-- vim.lsp.enable("clangd")
-- vim.lsp.enable("rust-analyzer")

vim.keymap.set("n", "gd", vim.lsp.buf.definition, {desc = "LSP go to definition"})
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {desc = "LSP go to declaration"})
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, attach_opts)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, attach_opts)
vim.keymap.set("n", "<leader>rr", require("telescope.builtin").lsp_references, attach_opts)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

local lspconfig = require('lspconfig')

-- nvim-cmp supports additional completion capabilities
local lsp_capabilities = vim.lsp.protocol.make_client_capabilities()
lsp_capabilities = require('cmp_nvim_lsp').default_capabilities(lsp_capabilities)

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        -- Replace these with whatever servers you want to install
        "lua_ls",
    },
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_on_attach,
            })
        end,
        ["wgsl_analyzer"] = function()
            lspconfig["wgsl_analyzer"].setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_on_attach,
                filetypes = { "wgsl" }
            })
        end,
        ["clangd"] = function()
            lspconfig["clangd"].setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_on_attach,
                cmd = { "clangd", "--header-insertion=never" }
            })
        end,
        ["lua_ls"] = function()
            lspconfig["lua_ls"].setup({
                capabilities = lsp_capabilities,
                on_attach = lsp_on_attach,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim", "it", "describe", "before_each", "after_each" }
                        }
                    }
                }
            })
        end,
    }
})

-- Stop formatting on save
vim.g.zig_fmt_autosave = 0

-- Recognize wgsl
vim.api.nvim_command("autocmd BufNewFile,BufRead *.wgsl set filetype=wgsl")

-- -- glsl
-- lspconfig.glslls.setup {
--     cmd = { "glslls", "--stdin", "--target-env=opengl4.5" },
--     capabilities = lsp_capabilities,
--     on_attach = lsp_on_attach,
-- }
--

