vim.pack.add({
    {
        src = "https://github.com/nvim-telescope/telescope.nvim",
        name = "telescope",
        version = "v0.2.2"
    },
    {
        src = "https://github.com/nvim-lua/plenary.nvim",
        version = "b9fd522"
    },
})

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>s', builtin.find_files, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
vim.keymap.set('n', '<leader>b', builtin.buffers, {})
vim.keymap.set('n', '<leader>h', builtin.help_tags, {})
