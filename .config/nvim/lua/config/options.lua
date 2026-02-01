-- Core Options. No plugin related stuffs.
--
-- Set a shorthand variable for vim.opt
local opt = vim.opt

-- Show a menu while autocompleting
opt.wildmenu = true

-- Show commands
opt.showcmd = flase

-- Disable the ruler
opt.ruler = false

-- Case insensitive search (unless capital letters are used)
opt.ignorecase = true
opt.smartcase = true

-- Relative line numbers
opt.relativenumber = true
opt.numberwidth = 4

-- Use spaces instead of tabs
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4

-- Indentation
opt.autoindent = true
opt.smartindent = true
vim.cmd("filetype plugin indent on")

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Colors
opt.termguicolors = true

-- Disable line wrapping
opt.wrap = false

-- Faster escape timeout
--vim.opt.timeoutlen = 300

-- Access System Clipboard
opt.clipboard = "unnamedplus"

-- Line Number Config
opt.statuscolumn = " %l %s "
-- Keeps the sign column at 1 cell wide so it doesn't jump around
vim.opt.signcolumn = "yes:1"
