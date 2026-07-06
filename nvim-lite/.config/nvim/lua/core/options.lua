-- Line Numbering
vim.opt.number = true
vim.opt.relativenumber = true

-- Number column modification
vim.opt.statuscolumn = " %s%l  "

-- Enable current line number highlighting
-- vim.opt.cursorline = true
-- vim.opt.cursorlineopt = "number"
-- Color
-- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#fbbf24", bold = true })


-- Permanently disable auto-commenting on new lines
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        -- 'c' = auto-wrap comments
        -- 'r' = auto-comment on Enter
        -- 'o' = auto-comment on 'o' or 'O'
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})


-- Auto-clear search highlights the exact moment you do anything else
vim.on_key(function(char)
    local key = vim.fn.keytrans(char)
    local search_keys = { "n", "N", "*", "#", "/", "?" }
    
    -- If we are in Normal mode, and the key pressed is NOT a search command
    if vim.fn.mode() == "n" and not vim.tbl_contains(search_keys, key) then
        -- And if the highlight paint is currently active
        if vim.v.hlsearch == 1 then
            vim.cmd("nohlsearch") -- Wipe it off the screen
        end
    end
end, vim.api.nvim_create_namespace("auto_hlsearch"))


-- Fix Tab space behaviour
vim.opt.tabstop = 4        -- A physical TAB character is rendered as 4 spaces wide
vim.opt.shiftwidth = 4     -- Pressing >> or << shifts the code by exactly 4 spaces
vim.opt.expandtab = true   -- Converts TAB presses into physical spaces (Absolute strict requirement for Python)
vim.opt.smartindent = true -- Intuitively indents the next line when you press Enter after a { or a loop


-- Case Insensitive Search
vim.opt.ignorecase = true
vim.opt.smartcase = true

