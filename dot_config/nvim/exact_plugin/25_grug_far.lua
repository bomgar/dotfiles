require("grug-far").setup({})

local wk = require("which-key")
wk.add({
  { "<leader>fR", "<cmd>GrugFar<cr>", desc = "search and replace", noremap = true, silent = true },
})
