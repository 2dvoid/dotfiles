return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.6", -- Or a more recent tag
	dependencies = { "nvim-lua/plenary.nvim" },

	-- 1. ADD THIS 'keys' TABLE
	keys = {
		-- Find files
		{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },

		-- Search text (live grep)
		{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },

		-- Find in current buffer
		{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },

		-- Find help tags
		{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

		-- See old files (same as dashboard)
		{ "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
	},

	-- 2. YOUR EXISTING CONFIG
	config = function()
		require("telescope").setup({
			defaults = {
				-- Your other telescope settings go here
				-- e.g., file_ignore_patterns = { "node_modules" }
			},
		})
	end,
}
