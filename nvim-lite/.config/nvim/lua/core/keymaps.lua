-- Leader Key (Try to keep this setting around the top of this file)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Pressing jk simulates Escape in insert mode
vim.keymap.set("i", "jk", "<Esc>", { noremap = true, silent = true })
