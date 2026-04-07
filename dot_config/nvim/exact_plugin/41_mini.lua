-- mini.icons
require("mini.icons").setup({})
MiniIcons.mock_nvim_web_devicons()

-- mini.indentscope
require("mini.indentscope").setup({})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "Trouble",
    "alpha",
    "dashboard",
    "fzf",
    "help",
    "lazy",
    "mason",
    "neo-tree",
    "notify",
    "snacks_dashboard",
    "snacks_notif",
    "snacks_terminal",
    "snacks_win",
    "toggleterm",
    "trouble",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "SnacksDashboardOpened",
  callback = function(data)
    vim.b[data.buf].miniindentscope_disable = true
  end,
})

-- mini.files
require("mini.files").setup({
  mappings = {
    go_in_plus = "<CR>",
  },
  windows = {
    preview = true,
    width_preview = 50,
  },
})

-- mini.hipatterns
require("mini.hipatterns").setup({
  highlighters = {
    fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
    hack  = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
    todo  = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
    note  = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
  },
})

-- mini.splitjoin
require("mini.splitjoin").setup({})

-- mini.ai
local ai = require("mini.ai")
ai.setup({
  n_lines = 500,
  custom_textobjects = {
    o = ai.gen_spec.treesitter({
      a = { "@block.outer", "@conditional.outer", "@loop.outer" },
      i = { "@block.inner", "@conditional.inner", "@loop.inner" },
    }),
    f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
    c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
    d = { "%f[%d]%d+" },
    u = ai.gen_spec.function_call(),
    U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
  },
})

-- keymaps
local wk = require("which-key")
wk.add({
  { "<leader>go", function() MiniDiff.toggle_overlay() end,                    desc = "Toggle minidiff overlay" },
  { "<leader>ed", function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, desc = "Browse current directory" },
  { "<leader>ec", function() MiniFiles.open() end,                             desc = "Browse cwd" },
  { "<leader>eh", function() MiniFiles.open("~") end,                          desc = "Browse home directory" },
  { "<leader>er", function() MiniFiles.open("/") end,                          desc = "Browse root directory" },
})
