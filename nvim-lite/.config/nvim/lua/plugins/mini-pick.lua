return {
    "echasnovski/mini.pick",
    version = false,
    
    config = function()
        require('mini.pick').setup()
        
        vim.ui.select = require('mini.pick').ui_select
    end,
}

