return {
    -- Source
    "CRAG666/code_runner.nvim",

    -- Target
    keys = {
        { "<leader>rr", "<cmd>w<CR><cmd>RunCode<CR>", desc = "Run current file" },
    },

    -- Settings
    opts = {
        mode = "float",
        float = {
            close_key = "<ESC>",
            border = "rounded",
            height = 0.8,
            width = 0.8,
            x = 0.5,
            y = 0.5,
            border_hl = "FloatBorder",
            float_hl = "Normal",
            blend = 0,
        },
        filetype = {
            -- Compiled Languages
	    c = { 'cd "$dir" &&', 'gcc "$fileName" -o "$fileNameWithoutExt" &&', './"$fileNameWithoutExt"' },
	    java = {
      			"cd $dir &&",
      			"javac $fileName &&",
      			"java $fileNameWithoutExt"
    	   },
            go = "cd $dir && go run $fileName",
            
            -- Interpreted & Scripting Languages
            python = "python3 -u",
            lua = "lua",
            ruby = "ruby",
            sh = "bash",
        },
    },
}

