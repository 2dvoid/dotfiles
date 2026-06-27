return {
    "folke/flash.nvim",
    opts = {
        modes = {
            -- This disables the plugin entirely for f, F, t, T, ;, and ,
            -- returning them to Neovim's default, silent behavior.
            char = {
                enabled = false,
            },
        },
    },
}
