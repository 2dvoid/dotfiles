return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    keys = {
        -- Find files
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },

        -- Find in current buffer
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find Buffers" },

        -- See old files
        { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },

        -- Theme Switcher (Added this for you)
        { "<leader>th", "<cmd>Telescope colorscheme<cr>", desc = "Switch Theme" },
    },

    config = function()
        local h_pct = 0.90
        local w_pct = 0.80
        local w_limit = 75

        require("telescope").setup({
            -- 1. GLOBAL DEFAULTS
            defaults = {
                borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
                preview = { hide_on_startup = true },
                layout_strategy = "vertical",
                layout_config = {
                    vertical = {
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
            }, -- <--- NOTICE: 'defaults' closes here with a comma

            -- 2. SPECIFIC PICKERS (Must be outside defaults)
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            },
        })
    end,
}
