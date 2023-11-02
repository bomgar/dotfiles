return {
  {
    'nvim-tree/nvim-tree.lua',
    lazy = true,
    cmd = { "NvimTreeToggle" },
    config = function()
      require("nvim-tree").setup()
    end
  },
}

