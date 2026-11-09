vim.pack.add({
    {
        src = "https://github.com/lewis6991/gitsigns.nvim",
        name = "gitsigns",
        version = "v2.1.0"
    }
})

require('gitsigns').setup()
