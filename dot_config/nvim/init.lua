vim.loader.enable()

local version = vim.version

require("settings")
require("init-lazy")
require("plugins")

if vim.g.vscode then
    -- VSCode extension
else
  require("theme")
end


