
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
        d = {
          name = "diffview",
          o = {"<cmd>DiffviewOpen<CR>", "open"},
          c = {"<cmd>DiffviewClose<CR>", "close"},
          h = {"<cmd>DiffviewFileHistory<CR>", "history"},
          f = {"<cmd>DiffviewFileHistory %<CR>", "file history"},
        },
        f = {
          name = "+find",
          f = {"<cmd>Telescope find_files<CR>", "Find File"},
          g = {"<cmd>Telescope live_grep<CR>", "Live Grep"},
          b = {"<cmd>Telescope buffers<CR>", "Buffers"},
          ["?"] = {"<cmd>Telescope help_tags<CR>", "Help Tags"},
          h = {"<cmd>Telescope harpoon marks<CR>", "Harpoon Marks"},
          m = {"<cmd>Telescope marks<CR>", "Marks"},
          j = {"<cmd>Telescope jumplist<CR>", "Jumplist"},
        },
        c = {
          name="text-case",
          t = {"<cmd>TextCaseOpenTelescope<CR>", "Telescope"},
        },
        h = {
          name = "harpoon", -- Group name
          a = { "<cmd>lua require('harpoon.mark').add_file()<CR>", "Add File" },
          m = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", "Menu" },
          n = { "<cmd>lua require('harpoon.ui').nav_next()<CR>", "Next Mark" },
          p = { "<cmd>lua require('harpoon.ui').nav_prev()<CR>", "Previous Mark" },
          ["1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<CR>", "Go to Mark 1" },
          ["2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<CR>", "Go to Mark 2" },
          ["3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<CR>", "Go to Mark 3" },
          ["4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<CR>", "Go to Mark 4" },
        },
        t = {
          name = "+test",
          r = {"<cmd>lua require(\"neotest\").run.run()<CR>", "Run test"},
          d = {"<cmd>lua require(\"neotest\").run.run({strategy = \"dap\"})<CR>", "Debug test"},
          f = {"<cmd>lua require(\"neotest\").run.run(vim.fn.expand(\"%\"))<CR>", "Run current file"},
          p = {"<cmd>Neotest output-panel<CR>", "Output panel"},
          o = {"<cmd>Neotest output<CR>", "Output"},
          s = {"<cmd>Neotest summary<CR>", "summary"},
        }
      }, { prefix = "<leader>" })
    end
  },
}
