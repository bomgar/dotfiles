vim.loader.enable()

local version = vim.version

function source_vim_config(file_name)
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/viml_conf/" .. file_name)
end


require("settings")
require("init-lazy")
require("plugins")
require("theme")

