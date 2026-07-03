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
