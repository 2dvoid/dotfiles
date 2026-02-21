return {
    {
        "folke/snacks.nvim",
        opts = {
            explorer = { enabled = false },
        },
        keys = {
            -- This explicitly deletes LazyVim's default explorer keymaps
            { "<leader>e", false },
            { "<leader>E", false },
        },
    },
}
