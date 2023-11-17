return {
  {
    "NeogitOrg/neogit",
    event="VeryLazy",
    enabled = not vim.g.vscode,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
    config = function()
      require('neogit').setup()
      vim.keymap.set('n', '<F12>', '<cmd>Neogit<cr>')
    end
  }
}
