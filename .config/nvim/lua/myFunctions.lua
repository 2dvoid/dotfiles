local M = {}

--------------------------Code Runner-----------------------
function M.codeRunner()
  -- Save current file
  vim.cmd("write")

  local ft = vim.bo.filetype
  local file = vim.fn.expand("%")
  local filename = vim.fn.expand("%:r")

  -- Table of runners: string or function
  local runners = {

    python = "python3 " .. file,
    lua    = "lua " .. file,
    c      = "gcc " .. file .. " -o " .. filename .. " && ./" .. filename,
    cpp    = "g++ " .. file .. " -o " .. filename .. " && ./" .. filename,
    java   = "javac " .. file .. " && java " .. filename,
    sh     = "bash " .. file,

  }

  local runner = runners[ft]
  local cmd = nil

  if type(runner) == "function" then
    cmd = runner()
  else
    cmd = runner
  end

  if not cmd then
    print("No runner configured for filetype: " .. ft)
    return
  end

  -- Open vertical split terminal and run
  vim.cmd("vsplit | terminal " .. cmd)
  vim.cmd("startinsert")
end

---------------------------Dummy Function------------------------------
function M.sayHello(name)
  print("Hello, " .. (name or "World") .. "!")
end
----------------------------------------------------------------

return M
