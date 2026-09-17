vim.keymap.set("n", "<leader>d", function()
    local qf_items = vim.diagnostic.toqflist(vim.diagnostic.get())
    table.sort(qf_items, function(a, b)
        -- type 'E' = Error, 'W' = Warning, 'I' = Info, 'N' = Hint
        if a.type ~= b.type then
            local severity_rank = { E = 1, W = 2, I = 3, N = 4 }
            local rank_a = severity_rank[a.type] or 5
            local rank_b = severity_rank[b.type] or 5
            if rank_a ~= rank_b then
                return rank_a < rank_b
            end
        end

        -- keep same-file and same-line order within the same severity level
        if a.bufnr ~= b.bufnr then
            return a.bufnr < b.bufnr
        end
        return a.lnum < b.lnum
    end)

    vim.fn.setqflist(qf_items)
    vim.cmd("copen")
end, { silent = true })

