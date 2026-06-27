return {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts

    opts = {
        default_file_explorer = true,
        delete_to_trash = false,
        view_options = {
            show_hidden = false,
        },
        columns = {
            "icon",
            -- "permissions",
            -- "size",
            -- "mtime",
        },
    },

    keys = {
        { "-", "<cmd>Oil --preview<cr>", desc = "Open parent directory" },
        { "<leader>e", "<cmd>Oil --preview<cr>", desc = "Open Oil Explorer" },
        { "<leader>E", "<cmd>Oil . --preview<cr>", desc = "Open Oil Explorer (cwd)" },
    },

    -- Optional dependencies
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
}
