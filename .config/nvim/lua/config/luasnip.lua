local ls = require("luasnip")

-- Keymaps
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set("i", "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

-- Load all Lua snippets from your folder
require("luasnip.loaders.from_lua").lazy_load({
  paths = vim.fn.stdpath("config") .. "/lua/snippets"
})
