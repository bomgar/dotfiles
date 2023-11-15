return {
  {
    "dcampos/nvim-snippy",
    config = function ()
      require('snippy').setup({})
      vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(snippy-next)', {silent = true})
      vim.api.nvim_set_keymap('s', '<C-j>', '<Plug>(snippy-next)', {silent = true})
    end
  }
}
