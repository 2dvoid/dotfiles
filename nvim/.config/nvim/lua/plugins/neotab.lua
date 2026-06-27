return {
    "kawre/neotab.nvim",
    event = "InsertEnter",
    opts = {
        -- We map this directly to Tab.
        -- LazyVim's blink.cmp is smart enough to use this as a "fallback"
        -- when its own completion menu or snippets aren't active.
        tabkey = "<Tab>",
        act_as_tab = true,
        behavior = "nested",
        pairs = {
            { open = "(", close = ")" },
            { open = "[", close = "]" },
            { open = "{", close = "}" },
            { open = "'", close = "'" },
            { open = '"', close = '"' },
            { open = "`", close = "`" },
            { open = "<", close = ">" }, -- Your custom C headers
        },
    },
}
