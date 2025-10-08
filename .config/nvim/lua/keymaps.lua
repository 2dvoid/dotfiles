-- Shorthand variable for vim.keymap.set
local keymap = vim.keymap.set

-- Leader Key
vim.g.mapleader = " "
keymap("n", "<Space>", "<Nop>", { silent = true })

-- Basic commands
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>w", ":w<CR>", { desc = "Save" })

-- Window split
-- keymap("n", "<leader>h", ":split<CR>", { desc = "Horizontal split" })
-- keymap("n", "<leader>v", ":vsplit<CR>", { desc = "Vertical split" })

-- Navigate splits with Ctrl + h/j/k/l
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- Yanking to Clipboard
-- keymap("n", "<leader>y", '"+y', { desc = "Yank to clipboard" })
-- keymap("v", "<leader>y", '"+y', { desc = "Yank to clipboard" })
-- keymap("n", "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })
-- keymap("v", "<leader>yy", '"+yy', { desc = "Yank line to clipboard" })

-- Pasting from Clipboard
-- keymap("n", "<leader>p", '"+p', { desc = "Paste after from clipboard" })
-- keymap("n", "<leader>P", '"+P', { desc = "Paste before from clipboard" })
-- keymap("v", "<leader>p", '"+p', { desc = "Paste after from clipboard" })
-- keymap("v", "<leader>P", '"+P', { desc = "Paste before from clipboard" })

-- Better yank/paste
-- keymap("n", "Y", "y$", { desc = "Yank to end of line" })
-- keymap("n", "<leader>Y", '"+y$', { desc = "Yank to end of line to clipboard" })
-- keymap("n", "0", "^", { desc = "Go to first non-blank char" })

-- Escape by pressing 'jk'
-- keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" })

---------------------- Custom Functions: -------------------------

local funcs = require("myFunctions")

-- Code Runner
-- Toggle with Leader+r
keymap("n", "<leader>r", funcs.codeRunner, { noremap = true, silent = true })

-- No Neck Pain
-- Toggle Center Layout with Leader+c
vim.keymap.set("n", "<leader>c", "<cmd>NoNeckPain<CR>", { desc = "Toggle Center Layout" })
