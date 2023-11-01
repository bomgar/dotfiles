
return {

  -- A list of colorscheme plugin you may want to try. Find what suits you.
  {
    "navarasu/onedark.nvim",
    config = function()
      local onedark = require('onedark')
      onedark.setup {
        style = 'deep'
      }
      onedark.load()

    end,

  },
}
