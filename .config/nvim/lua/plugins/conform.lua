return {
	"stevearc/conform.nvim",
	-- We change the event here to load the plugin earlier if needed
	event = { "BufReadPre", "BufNewFile" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			c = { "clang-format" },
			cpp = { "clang-format" },
			java = { "google-java-format" },
			sh = { "shfmt" },
			python = { "isort", "black" },
			javascript = { "prettier" },
			--html = { "prettier" },
			--css = { "prettier" },
			--json = { "prettier" },
			--yaml = { "prettier" },
			lua = { "stylua" },
			go = { "gofmt", "goimports" },
			rust = { "rustfmt" },
		},

		-- You can keep format_on_save enabled as a fallback
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = false,
		},
	},
	config = function(_, opts)
		require("conform").setup(opts)

		-- ★★★ THIS IS THE NEW PART FOR REAL-TIME FORMATTING ★★★
		vim.api.nvim_create_autocmd("InsertLeave", {
			pattern = "*",
			group = vim.api.nvim_create_augroup("conform_format_on_insert_leave", { clear = true }),
			callback = function()
				require("conform").format({ async = true, lsp_fallback = false })
			end,
		})
	end,
}
