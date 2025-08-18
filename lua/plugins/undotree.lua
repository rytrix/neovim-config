return {
    "mbbill/undotree",     -- undo tree view (<Leader> space)
    commit = "28f2f54",
    config = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {})
    end
}
