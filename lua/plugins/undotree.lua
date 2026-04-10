vim.pack.add({
    {
        src = "https://github.com/mbbill/undotree",
        name = "undotree",
        version = "28f2f54"
    },
})

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {})
