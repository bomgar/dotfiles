require("snipe").setup({
  ui = {
    position = "center",
  },
  sort = "last",
})

local wk = require("which-key")
wk.add({
  { "gb", function() require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu" },
})
