return {
    "mbbill/undotree",     -- undo tree view (<Leader> space)
    config = function()
        vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, {})
    end
}
