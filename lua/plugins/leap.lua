return {
    "ggandor/leap.nvim",
    commit = "8b03b5d",
    dependencies = {
        {
            "tpope/vim-repeat",
            commit = "6584602"
        }
    },
    config = function ()
        require('leap').create_default_mappings()
    end
}
