-- SchemaStore is a dependency, no setup needed

-- lazydev
require("lazydev").setup({
  library = {},
})

-- lspconfig
require("lspconfig")
vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local which_key = require("which-key")

    local filter = { bufnr = event.buf }
    which_key.add({
      buffer = event.buf,

      { "gd", vim.lsp.buf.definition,      desc = "goto definition (lsp)" },
      { "gD", vim.lsp.buf.declaration,     desc = "goto declaration (lsp)" },
      { "gi", vim.lsp.buf.implementation,  desc = "goto implementation (lsp)" },
      { "go", vim.lsp.buf.type_definition, desc = "goto type definition (lsp)" },
      { "gr", vim.lsp.buf.references,      desc = "references (lsp)" },
      { "gs", vim.lsp.buf.signature_help,  desc = "signature help (lsp)" },
      { "gl", vim.diagnostic.open_float,   desc = "open diagnostic (lsp)" },
      {
        "gh",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter)
        end,
        desc = "toggle inlay hints"
      },
      { "K",    vim.lsp.buf.hover,                                   desc = "hover (lsp)" },
      { "<F2>", vim.lsp.buf.rename,                                  desc = "rename (lsp)" },
      { "<F3>", function() vim.lsp.buf.format({ async = true }) end, desc = "format (lsp)" },
    })
    which_key.add({
      buffer = event.buf,
      mode = { "n", "v" },
      { "<leader>.", vim.lsp.buf.code_action, desc = "code action (lsp)" },
    })
  end,
})

-- mason
require("mason").setup({})

-- mason-lspconfig
require("mason-lspconfig").setup({
  automatic_enable = true,
  ensure_installed = {
    "astro",
    "bashls",
    "cssls",
    "cssmodules_ls",
    "gopls",
    "helm_ls",
    "html",
    "jsonls",
    "lua_ls",
    "pyright",
    "rust_analyzer",
    "svelte",
    "templ",
    "terraformls",
    "vtsls",
    "yamlls",
    "zls",
  },
})

-- mason-nvim-dap
require("mason-nvim-dap").setup({
  automatic_installation = false,
  ensure_installed = {
    "codelldb",
    "delve",
  },
  handlers = {},
})

-- dap-go
require("dap-go").setup()

-- dap signs
local symbols = {
  Breakpoint          = " ",
  BreakpointCondition = " ",
}
for name, icon in pairs(symbols) do
  local hl = "Dap" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

-- dapui
local dap, dapui = require("dap"), require("dapui")
dapui.setup({})
dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

-- dap keymaps
local wk = require("which-key")
wk.add({
  { "<leader>bc", function() require("dap").continue() end,          desc = "continue" },
  { "<leader>bo", function() require("dap").step_over() end,         desc = "step over" },
  { "<leader>bi", function() require("dap").step_into() end,         desc = "step into" },
  { "<leader>be", function() require("dap").step_out() end,          desc = "step out" },
  { "<leader>bb", function() require("dap").toggle_breakpoint() end, desc = "toggle breakpoint" },
  { "<leader>tg", function() require("dap-go").debug_test() end,     desc = "Debug go test" },
})
