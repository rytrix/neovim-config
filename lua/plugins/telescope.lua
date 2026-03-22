return {
    "nvim-telescope/telescope.nvim",
    version = "0.2.1",
    dependencies = {
        { 'nvim-lua/plenary.nvim',                    commit = "b9fd522" },
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make',    commit = "6fea601" },
    },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>s', builtin.find_files, {})
        vim.keymap.set('n', '<leader>g', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>b', builtin.buffers, {})
        vim.keymap.set('n', '<leader>h', builtin.help_tags, {})

        require('telescope').load_extension('fzf')
    end
}
