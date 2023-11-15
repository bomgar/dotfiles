
return {

  {
    "navarasu/onedark.nvim",
    config = function()
      local onedark = require('onedark')
      onedark.setup {
        style = 'darker',
        colors = {
          bg0 = "#1e2127",
        },
      }
      onedark.load()

    end,

  },
}
