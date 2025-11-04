-- No Neck Pain (Center Layout)

return {

	"shortcuts/no-neck-pain.nvim",
	version = "*", -- latest stable
	opts = {

		width = 72, -- pick something < :echo &columns
		minSideBufferWidth = 5,
		autocmds = {
			enableOnVimEnter = "safe",
			skipEnteringNoNeckPainBuffer = true,
		},
		mappings = {
			enabled = true,
			-- Sets a global mapping to Neovim, which allows you to toggle the plugin.
			-- When `false`, the mapping is not created.
			---@type string
			toggle = "<Leader>np",
			-- Sets a global mapping to Neovim, which allows you to increase the width (+5) of the main window.
			-- When `false`, the mapping is not created.
			---@type string | { mapping: string, value: number }
			widthUp = "<Leader>nl",
			-- Sets a global mapping to Neovim, which allows you to decrease the width (-5) of the main window.
			-- When `false`, the mapping is not created.
			---@type string | { mapping: string, value: number }
			widthDown = "<Leader>nh",
			-- Sets a global mapping to Neovim, which allows you to toggle the scratchPad feature.
			-- When `false`, the mapping is not created.
			---@type string
			scratchPad = "<Leader>ns",
		},
		dashboard = {
			-- When `true`, debounce will be applied to the init method, leaving time for the dashboard to open.
			enabled = true,
			-- if a dashboard that you use isn't supported, you can use this field to set a matching filetype, also don't hesitate to open a pull-request with the edited list (DASHBOARDS) found in lua/no-neck-pain/util/constants.lua.
			---@type string[]|nil
			filetypes = "alpha",
		},
	},
}
