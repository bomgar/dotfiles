
return {

  -- showing keybindings
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      local which_key = require("which-key")
      which_key.setup { }
      which_key.register({
        e = {"<cmd>NvimTreeToggle<CR>", "Toggle NvimTree"},
        f = {
          name = "+find",
          f = {"<cmd>:Telescope find_files<CR>", "Find File"},
          g = {"<cmd>:Telescope live_grep<CR>", "Live Grep"},
          b = {"<cmd>:Telescope buffers<CR>", "Buffers"},
          h = {"<cmd>:Telescope help_tags<CR>", "Help Tags"}
        },
        t = {
          name = "+test",
          r = {"<cmd>:Neotest run<CR>", "Run test"},
          p = {"<cmd>:Neotest output-panel<CR>", "Output panel"},
          o = {"<cmd>:Neotest output<CR>", "Output"},
          s = {"<cmd>:Neotest summary<CR>", "summary"},
        }
      }, { prefix = "<leader>" })
    end
  },
}
