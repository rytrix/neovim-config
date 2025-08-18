return {
    {
        "neovim/nvim-lspconfig",
        tag = "v2.4.0",
        dependencies = {
            {
                "williamboman/mason.nvim", -- :Mason to download lsps
                build = ":MasonUpdate",    -- :MasonUpdate updates registry contents
                tag = "v2.0.1",
            },
            {
                "williamboman/mason-lspconfig.nvim",
                tag = "v2.1.0",
            },
            {
                "hrsh7th/nvim-cmp",     -- Autocompletion plugin
                commit = "b5311ab",
                dependencies = {
                    {
                        "hrsh7th/cmp-nvim-lsp",     -- LSP source for nvim-cmp
                        commit = "bd5a7d6",
                    },
                    {
                        "hrsh7th/cmp-nvim-lua",
                        commit = "f12408b",
                    },
                    {
                        "hrsh7th/cmp-buffer",
                        commit = "b74fab3",
                    },
                    {
                        "hrsh7th/cmp-path",
                        commit = "c642487",
                    },
                    {
                        "L3MON4D3/LuaSnip",     -- Snippets plugin
                        tag = "v2.4.0",
                    },
                    {
                        "saadparwaiz1/cmp_luasnip",     -- source for nvim-cmp
                        commit = "98d9cb5",
                    },
                },
                lazy = true,
                event = { "BufReadPre", "BufNewFile" },
            },
        },
        config = function()
            local lspconfig = require('lspconfig')
            local lsp_on_attach = function(_, bufnr)
                local attach_opts = { silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, attach_opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
                vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
                -- vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
                -- vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
                -- vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
                --     attach_opts)
                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
                vim.keymap.set('n', '<leader>rr', require('telescope.builtin').lsp_references, attach_opts)
                vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, attach_opts)
                vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
            end

            vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

            vim.diagnostic.config({
                -- update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",
                    -- border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })

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

            -- glsl
            lspconfig.glslls.setup {
                cmd = { "glslls", "--stdin", "--target-env=opengl4.5" },
                capabilities = lsp_capabilities,
                on_attach = lsp_on_attach,
            }

            -- completion
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
                        -- behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                    ['<Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() == 1 then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() == 1 then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { 'i', 's' }),
                    ['<S-Tab>'] = cmp.mapping(function(fallback)
                        if cmp.visible() == 1 then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) == 1 then
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
        end
    },
}
