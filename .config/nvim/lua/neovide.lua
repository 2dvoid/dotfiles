-- lua/neovide.lua

-- This guard is important!
-- It ensures these settings only apply when running Neovide.
if not vim.g.neovide then
	return
end

-- -----------------
-- Neovide Settings
-- -----------------

-- Set your font
-- Fira Code Mono (Neovide Default)
--vim.opt.guifont = "FiraCode Nerd Font Mono:h14"
--
-- JetBrains Mono Nerd
--vim.opt.guifont = "JetBrainsMonoNL Nerd Font:h14"
--
-- IBM Plex Mono Nerd
vim.opt.guifont = "BlexMono Nerd Font:h15"

-- Animations
vim.g.neovide_scroll_animation_length = 0.3
vim.g.neovide_cursor_animation_length = 0.1
--vim.g.neovide_cursor_vfx_mode = "railgun" -- Try "railgun", "torpedo", "pixiedust"

-- Transparency & Blur
--vim.g.neovide_normal_opacity = 0.95
--vim.g.neovide_window_blurred = true

-- Theme
vim.g.neovide_theme = "dark"

-- Padding
--vim.g.neovide_padding_top = 10
--vim.g.neovide_padding_bottom = 10
--vim.g.neovide_padding_right = 10
--vim.g.neovide_padding_left = 10

-- Other
vim.g.neovide_hide_mouse_when_typing = true
