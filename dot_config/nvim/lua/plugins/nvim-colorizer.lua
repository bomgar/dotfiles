

return {
  -- The missing auto-completion for cmdline!
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup()
    end
  },
}
