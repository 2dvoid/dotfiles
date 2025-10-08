-- Set a shorthand variable for vim.opt
local opt = vim.opt

-- Show a menu while autocompleting
opt.wildmenu = true

-- Show commands
opt.showcmd = true

-- Case insensitive search (unless capital letters are used)
opt.ignorecase = true
opt.smartcase = true

-- Relative line numbers
opt.relativenumber = true

-- Use spaces instead of tabs
opt.expandtab = true
opt.smarttab = true
opt.shiftwidth = 4
opt.tabstop = 4

-- Indentation
opt.autoindent = true
opt.smartindent = true

-- Splits
opt.splitbelow = true
opt.splitright = true

-- Colors
opt.termguicolors = true

-- Disable line wrapping
opt.wrap = false

-- Faster escape timeout
vim.opt.timeoutlen = 200


-------------Colorscheme------------------

-- Set Tokyonight style: "storm", "night", "day", "moon"
--vim.g.tokyonight_style = "night"

-- Optional: make comments italic
--vim.g.tokyonight_italic_comments = true

-- Optional: transparent background
--vim.g.tokyonight_transparent = true

-- Apply the colorscheme
--vim.cmd[[colorscheme tokyonight-night]]
