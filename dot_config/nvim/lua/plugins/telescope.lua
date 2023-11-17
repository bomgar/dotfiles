
return {

  {
    'nvim-telescope/telescope.nvim',
    enabled = not vim.g.vscode,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
    end,
  },
}
