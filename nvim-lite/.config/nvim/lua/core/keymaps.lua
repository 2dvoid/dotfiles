-- Leader Key (Try to keep this setting around the top of this file)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Pressing jk simulates Escape in insert mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })

-- Save current file
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save file' })

-- Quit the current file
vim.keymap.set('n', '<leader>q', '<cmd>q<CR>', { desc = 'Quit' })

-- Save and quit 
--vim.keymap.set('n', '<leader>x', '<cmd>x<CR>', { desc = 'Save and quit' })

-- Force quit and destroy unsaved changes (Panic button)
--vim.keymap.set('n', '<leader>Q', '<cmd>q!<CR>', { desc = 'Force quit (No save)' })


-- Toggle line number
vim.keymap.set('n', '<leader>nn', '<cmd>set number! relativenumber!<CR>', { desc = 'Toggle line number' })

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

-- Split Management
-- -- Navigate between panes using Ctrl + hjkl
-- vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Move to left split' })
-- vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Move to lower split' })
-- vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Move to upper split' })
-- vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Move to right split' })

-- Resize panes using the arrow keys
vim.keymap.set('n', '<Up>', ':resize +2<CR>', { desc = 'Increase window height' })
vim.keymap.set('n', '<Down>', ':resize -2<CR>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', { desc = 'Increase window width' })

