
return {

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    cond = firenvim_not_active,
    config = function()
      require('lualine').setup({
        theme = 'onedark'
      })
    end,
  },
}
