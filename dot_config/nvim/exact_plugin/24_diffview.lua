require("diffview").setup({})

local wk = require("which-key")
wk.add({
  { "<leader>do", "<cmd>DiffviewOpen<CR>",          desc = "open" },
  { "<leader>dc", "<cmd>DiffviewClose<CR>",         desc = "close" },
  { "<leader>dh", "<cmd>DiffviewFileHistory<CR>",   desc = "history" },
  { "<leader>df", "<cmd>DiffviewFileHistory %<CR>", desc = "file history" },
})
