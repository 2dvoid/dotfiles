local opts = {
	theme = "dark",
	transparent = false,
	styles = {
		-- You can set any of the style values specified for `:h nvim_set_hl`
		comments = { italic = true },
		functions = { bold = true },
		keywords = { italic = true },
		--type = { bold = true },
		lsp = { underline = false },
		match_paren = { underline = true, bold = true },
		variables = {},
	},
}

local function config()
	local plugin = require("no-clown-fiesta")
	return plugin.load(opts)
end

return {
	"aktersnurra/no-clown-fiesta.nvim",
	priority = 1000,
	config = config,
	lazy = false,
}
