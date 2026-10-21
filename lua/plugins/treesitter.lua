vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        name = "nvim-treesitter",
        version = "29212d8"
    }
})

-- rebuild parsers when the plugin updates so they match its queries
vim.api.nvim_create_autocmd("PackChanged", {
    callback = function(ev)
        if ev.data.spec.name == "nvim-treesitter" and ev.data.kind == "update" then
            vim.cmd("TSUpdate")
        end
    end,
})

require('nvim-treesitter').setup {
    -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
    install_dir = vim.fn.stdpath('data') .. '/site'
}

-- needs the tree-sitter cli and a c compiler; no-op once installed
require("nvim-treesitter").install({ "c", "cpp", "rust", "wgsl" })

-- start treesitter for any filetype that has a parser, silently skip the rest
vim.api.nvim_create_autocmd("FileType", {
    callback = function(ev)
        pcall(vim.treesitter.start, ev.buf)
    end,
})
