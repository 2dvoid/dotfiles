return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#12140e',
				base01 = '#12140e',
				base02 = '#83877d',
				base03 = '#83877d',
				base04 = '#d5dbce',
				base05 = '#fcfff8',
				base06 = '#fcfff8',
				base07 = '#fcfff8',
				base08 = '#ffb09f',
				base09 = '#ffb09f',
				base0A = '#c7e5a3',
				base0B = '#a9faa3',
				base0C = '#edffd8',
				base0D = '#c7e5a3',
				base0E = '#e3ffc2',
				base0F = '#e3ffc2',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#83877d',
				fg = '#fcfff8',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#c7e5a3',
				fg = '#12140e',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#83877d' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#edffd8', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#e3ffc2',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#c7e5a3',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#c7e5a3',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#edffd8',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#a9faa3',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#d5dbce' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#d5dbce' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#83877d',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
