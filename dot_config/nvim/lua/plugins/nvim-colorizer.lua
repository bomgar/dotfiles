

return {
  {
    "NvChad/nvim-colorizer.lua",
    enabled = not vim.g.vscode,
    config = function()
      require('colorizer').setup()
    end
  },
}
