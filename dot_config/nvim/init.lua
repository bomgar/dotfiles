vim.loader.enable()

local version = vim.version

require("settings")
require("init-lazy")

if vim.g.vscode then
  -- vscode enabled
else
  -- vscode not enabled
end


