-- No Neck Pain (Center Layout)
return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",          -- latest stable
  cmd = "NoNeckPain",     -- ensures it loads when you call the command
  opts = {
    width = 72,           -- pick something < :echo &columns
    minSideBufferWidth = 5,
  },
}
