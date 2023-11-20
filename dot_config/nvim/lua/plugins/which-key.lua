
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
          f = {function() require('telescope.builtin').find_files() end, "Find File"},
          ["."] = {function() require('telescope.builtin').find_files({hidden=true}) end, "Find hidden files"},
          c = {function() require('telescope.builtin').command_history() end, "command history"},
          a = {function() require('telescope.builtin').builtin() end, "all pickers"},
          g = {function() require('telescope.builtin').live_grep() end, "Live Grep"},
          b = {function() require('telescope.builtin').buffers() end, "Buffers"},
          ["?"] = {function() require('telescope.builtin').help_tags() end, "Help Tags"},
          h = {"<cmd>Telescope harpoon marks<CR>", "Harpoon Marks"},
          m = {function() require('telescope.builtin').marks() end, "Marks"},
          j = {function() require('telescope.builtin').jumplist() end, "Jumplist"},
          q = {function() require('telescope.builtin').quickfix() end, "quickfix"},
        },
        c = {
          name="text-case",
          t = {"<cmd>TextCaseOpenTelescope<CR>", "Telescope"},
        },
        h = {
          name = "harpoon", -- Group name
          a = { function() require('harpoon.mark').add_file() end, "Add File" },
          m = { function() require('harpoon.ui').toggle_quick_menu() end, "Menu" },
          n = { function() require('harpoon.ui').nav_next() end, "Next Mark" },
          p = { function() require('harpoon.ui').nav_prev() end, "Previous Mark" },
          ["1"] = { function() require('harpoon.ui').nav_file(1) end, "Go to Mark 1" },
          ["2"] = { function() require('harpoon.ui').nav_file(2) end, "Go to Mark 2" },
          ["3"] = { function() require('harpoon.ui').nav_file(3) end, "Go to Mark 3" },
          ["4"] = { function() require('harpoon.ui').nav_file(4) end, "Go to Mark 4" },
        },
        t = {
          name = "+test",
          r = {function() require("neotest").run.run() end, "Run test"},
          d = {function() require("neotest").run.run({strategy = "dap"}) end, "Debug test"},
          f = {function() require("neotest").run.run(vim.fn.expand("%")) end, "Run current file"},
          p = {"<cmd>Neotest output-panel<CR>", "Output panel"},
          o = {"<cmd>Neotest output<CR>", "Output"},
          s = {"<cmd>Neotest summary<CR>", "summary"},
        }
      }, { prefix = "<leader>" })
    end
  },
}
