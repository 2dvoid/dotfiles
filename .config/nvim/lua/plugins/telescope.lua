return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6", -- Or a more recent tag
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},

	-- 1. ADD THIS 'keys' TABLE
	keys = {
		-- Find files
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },

		-- Search text (live grep)
		--{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },

		-- Find in current buffer
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },

		-- Find help tags
		--{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

		-- See old files (same as dashboard)
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
	},

	-- 2. YOUR EXISTING CONFIG
	config = function()
		-- ADD THESE VARIABLES FROM YOUR NEW CONFIG
		local h_pct = 0.90
		local w_pct = 0.80
		local w_limit = 75

		require("telescope").setup({
			defaults = {
				-- ADD YOUR NEW SETTINGS INSIDE 'defaults'
				borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
				preview = { hide_on_startup = true },
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						--mirror = false,
						prompt_position = "bottom",
						width = function(_, cols, _)
							return math.min(math.floor(w_pct * cols), w_limit)
						end,
						height = function(_, _, rows)
							return math.floor(rows * h_pct)
						end,
						preview_cutoff = 10,
						preview_height = 0.4,
					},
				},

				-- Your other telescope settings go here
				-- e.g., file_ignore_patterns = { "node_modules" }
			},
		})
	end,
}
