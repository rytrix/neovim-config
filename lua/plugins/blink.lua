vim.pack.add({
    {
        src = "https://github.com/saghen/blink.cmp",
        name = "blink-cmp",
        version = "v1.10.2"
    }
})

require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<C-n>'] = { 'show', 'select_next', 'fallback' },
        ['<tab>'] = { 'accept', 'fallback' },
    },
    appearance = {
        nerd_font_variant = 'mono'
    },
    completion = {
        documentation = { auto_show = false },
        menu = { auto_show = false },
        list = { selection = { preselect = true }},
    },
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    fuzzy = {
        implementation = "prefer_rust_with_warning"
    }
})
