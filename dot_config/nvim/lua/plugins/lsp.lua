return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/cmp-nvim-lsp',
      'neovim/nvim-lspconfig',
      'williamboman/mason-lspconfig.nvim',
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function()
      local lspconfig = require('lspconfig')
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = {buffer = event.buf}

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
          vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
          vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
          vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
          vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
          vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
          vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

          vim.keymap.set('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
          vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
          vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts) 
        end
      })

      local default_setup = function(server)
        lspconfig[server].setup({
          capabilities = lsp_capabilities,
        })
      end

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          "tsserver",
          "astro",
          "svelte",
          "rust_analyzer",
        },
        handlers = {default_setup},
      })

    end
  }
}
