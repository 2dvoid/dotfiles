return {
  "CRAG666/code_runner.nvim",
  
  -- ADDED: This defines the keybind specifically for this plugin
  keys = {
    { "<leader>r", "<cmd>RunCode<CR>", desc = "Run Code" },
  },

  config = function()
    -- 1. Setup the plugin
    require("code_runner").setup({
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
        java = { "cd $dir &&", "javac $fileName &&", "java $fileNameWithoutExt" },
        python = "python3 -u",
        lua = "lua",
        ruby = "ruby",
        c = { "cd $dir &&", "gcc $fileName -o $fileNameWithoutExt &&", "./$fileNameWithoutExt" },
        cpp = { "cd $dir &&", "g++ $fileName -o $fileNameWithoutExt &&", "./$fileNameWithoutExt" },
        sh = "bash",
      },
    })

    -- 2. THE FIX: Auto-enter Insert Mode when a Terminal opens
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        vim.cmd("startinsert")
      end,
    })
  end,
}
