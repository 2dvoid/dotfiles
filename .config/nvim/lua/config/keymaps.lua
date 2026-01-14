-- Don't put any plugin related keymaps here.
-- Only core keymaps should live in here.
--
-- Shorthand variable for vim.keymap.set
local keymap = vim.keymap.set

-- Leader Key
vim.g.mapleader = " "
keymap("n", "<Space>", "<Nop>", { silent = true })

-- Basic commands
keymap("n", "<leader>s", ":w<CR>", { desc = "Write (Save) file" })
keymap("i", "<C-s>", "<ESC>:w<CR>a", { desc = "Write (Save) file" })

keymap("n", "<leader>q", ":bd<CR>", { desc = "Buffer Delete" })

-- Navigate splits with Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- Yanking to Clipboard
keymap("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap("n", "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })
keymap("v", "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })

-- Pasting from Clipboard
keymap("n", "<leader>p", '"+p', { desc = "Paste after from clipboard" })
keymap("n", "<leader>P", '"+P', { desc = "Paste before from clipboard" })
keymap("v", "<leader>p", '"+p', { desc = "Paste after from clipboard" })
keymap("v", "<leader>P", '"+P', { desc = "Paste before from clipboard" })

-- Better yank/paste
-- keymap("n", "Y", "y$", { desc = "Yank to end of line" })
-- keymap("n", "<leader>Y", '"+y$', { desc = "Yank to end of line to clipboard" })
-- keymap("n", "0", "^", { desc = "Go to first non-blank char" })

-- Escape by pressing 'jk'
-- keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })
