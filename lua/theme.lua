-- make every colorscheme transparent by clearing the backgrounds after it loads
vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function()
        for _, group in ipairs({ 'Normal', 'NormalNC', 'NormalFloat', 'FloatBorder', 'SignColumn', 'EndOfBuffer' }) do
            vim.api.nvim_set_hl(0, group, vim.tbl_extend('force', vim.api.nvim_get_hl(0, { name = group, link = false }), { bg = 'none', ctermbg = 'none' }))
        end

        vim.api.nvim_set_hl(0, 'StatusLine',   { fg = '#cdd6f4', bg = 'none' }) -- focused window
        vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = '#6c7086', bg = 'none' }) -- other windows
    end,
})

vim.cmd.colorscheme 'catppuccin'
