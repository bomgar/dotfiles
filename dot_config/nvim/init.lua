vim.loader.enable()

local version = vim.version

function source_vim_config(file_name)
  vim.cmd("source " .. vim.fn.stdpath("config") .. "/viml_conf/" .. file_name)
end


require("globals")
require("init-lazy")
source_vim_config("options.vim")
require("plugins")
require("theme")

