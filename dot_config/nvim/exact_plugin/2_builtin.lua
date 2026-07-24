vim.cmd.packadd("nvim.difftool")
vim.cmd.packadd("nvim.undotree")

require("which-key").add({
  { "[t", "<cmd>tabprevious<CR>", desc = "previous tab" },
  { "]t", "<cmd>tabnext<CR>",     desc = "next tab" },
})
