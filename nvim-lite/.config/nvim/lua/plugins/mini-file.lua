return {
    -- Source
    "echasnovski/mini.files",
    version = '*', 
    
    -- Dependencies
    dependencies = { 
	-- For icons
        { "echasnovski/mini.icons", opts = {} } 
    },
    
    -- Triggers
    keys = {
        { 
            "<leader>mf", 
            "<cmd>lua MiniFiles.open()<CR>", 
            desc = "Open mini.files" 
        },
    },
    
    opts = {
        options = {
            use_as_default_explorer = false,
        },
        windows = {
            preview = true,
	    max_number = 2,
    	    -- -- Width of focused window
            width_focus = 40,
    	    -- -- Width of preview window
            width_preview = 70,
        },
	mappings = {
	    go_in = 'l',
    	    go_in_plus = '<CR>',
	},
    },
}

