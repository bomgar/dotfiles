
return {

  {
    "nvim-lualine/lualine.nvim",
    enabled = not vim.g.vscode,
    event = "VeryLazy",
    cond = firenvim_not_active,
    config = function()
      require('lualine').setup({
        theme = 'onedark'
      })
    end,
  },
}
