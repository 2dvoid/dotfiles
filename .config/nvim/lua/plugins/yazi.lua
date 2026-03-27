return {
    "mikavilpas/yazi.nvim",
    version = "*",
    event = "VeryLazy",
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        -- Hijacking LazyVim's default explorer keybinds!
        {
            "<leader>e",
            "<cmd>Yazi<cr>",
            desc = "Open Yazi at the current file",
        },
        {
            "<leader>E",
            "<cmd>Yazi cwd<cr>",
            desc = "Open Yazi in nvim's working directory",
        },
        {
            "<c-up>",
            "<cmd>Yazi toggle<cr>",
            desc = "Resume the last yazi session",
        },
    },
    ---@type YaziConfig | {}
    opts = {
        -- Changed to true: This forces Neovim to use Yazi when you type `nvim .`
        open_for_directories = true,
        keymaps = {
            show_help = "<f1>",
        },
    },
    init = function()
        -- Kills Neovim's default, clunky file explorer (netrw)
        vim.g.loaded_netrwPlugin = 1
    end,
}
