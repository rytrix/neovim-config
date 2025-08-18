-- return {
-- }
return {
    {
        'lewis6991/gitsigns.nvim', -- Add git related info in the signs columns and popups
        tag = "v1.0.2",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('gitsigns').setup {
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
                on_attach = function(bufnr)
                    vim.keymap.set('n', '[c', require('gitsigns').prev_hunk, { buffer = bufnr })
                    vim.keymap.set('n', ']c', require('gitsigns').next_hunk, { buffer = bufnr })
                end,
            }
        end
    }
}
