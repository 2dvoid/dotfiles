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


-- Tabout like behaviour
vim.keymap.set('i', '<Tab>', function()
    -- Calculate the exact physical position of the cursor
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    local char_under_cursor = line:sub(col, col)
    
    -- Boundaries you want to jump over
    local boundaries = { 
        ['"'] = true, 
        ["'"] = true, 
        ['`'] = true, 
        [')'] = true, 
        [']'] = true, 
        ['}'] = true,
        [';'] = true,
        [','] = true,
    }
    
    
    if boundaries[char_under_cursor] then
        return '<Right>'
    else
        return '<Tab>'
    end
end, { expr = true, replace_keycodes = true, desc = "Native Tabout" })



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

