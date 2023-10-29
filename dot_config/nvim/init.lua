vim.loader.enable()

local version = vim.version

require("settings")

if vim.g.vscode then
    -- VSCode extension
else
  require("init-lazy")
  require("plugins")
  require("theme")
end


