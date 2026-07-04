-- Leader Key (Try to keep this setting around the top of this file)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Pressing jk simulates Escape in insert mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })


-- Intuitively jump out of closing brackets and quotes using Tab
vim.keymap.set('i', '<Tab>', function()
    -- Capture the exact line and cursor column
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    
    -- Extract the single character immediately to the right of your cursor
    local char_right = line:sub(col, col)
    
    -- The strict list of characters we are allowed to jump over
    local closing_chars = { ")", "]", "}", '"', "'", "`" }
    
    -- The Logic
    if vim.tbl_contains(closing_chars, char_right) then
        return "<Right>" -- Teleport over the bracket
    else
        return "<Tab>"   -- Act like a normal Tab key
    end
end, { expr = true, replace_keycodes = true, desc = "Tab out of pairs" })

