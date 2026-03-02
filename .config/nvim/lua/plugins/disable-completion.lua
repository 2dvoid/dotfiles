return {
    -- Disable the older completion engine
    { "hrsh7th/nvim-cmp", enabled = false },

    -- Disable the newer completion engine (LazyVim's current default)
    { "saghen/blink.cmp", enabled = false },

    -- Disable Snippet engines that feed the popup
    { "L3MON4D3/LuaSnip", enabled = false },
    { "garymjr/nvim-snippets", enabled = false },
}
