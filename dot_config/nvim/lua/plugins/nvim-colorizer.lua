

return {
  -- The missing auto-completion for cmdline!
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
    end
  },
}
