return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "simrat39/rust-tools.nvim",
      "nvim-lua/plenary.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "jay-babu/mason-nvim-dap.nvim",
      "folke/neodev.nvim",
    },
    config = function()
      require("neodev").setup({})

      local lspconfig = require('lspconfig')
      local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local opts = {buffer = event.buf}

          local which_key = require("which-key")

          which_key.register({
            d =  {'<cmd>lua vim.lsp.buf.definition()<cr>', "goto definition (lsp)"},
            D =  {'<cmd>lua vim.lsp.buf.declaration()<cr>', "goto declaration (lsp)"},
            i =  {'<cmd>lua vim.lsp.buf.implementation()<cr>', "goto implementation (lsp)"},
            o =  {'<c>md>lua vim.lsp.buf.type_definition()<cr>', "goto type definition (lsp)"},
            r =  {'<cmd>lua vim.lsp.buf.references()<cr>', "references (lsp)"},
            s =  {'<cmd>lua vim.lsp.buf.signature_help()<cr>', "signature help (lsp)"},
            l = {'<cmd>lua vim.diagnostic.open_float()<cr>', "open diagnostic (lsp)"}
          }, {prefix="g", buffer=event.buf})

          which_key.register({
            ["."] = {'<cmd>lua vim.lsp.buf.code_action()<cr>', "code action (lsp)"}
          }, {prefix="<leader>", buffer=event.buf})

          vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
          vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
          vim.keymap.set('n', '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)

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
      require ('mason-nvim-dap').setup({
        ensure_installed = {'codelldb'},
        handlers = {}, -- sets up dap in the predefined manner
      })

      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({})
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      require('mason-lspconfig').setup({
        ensure_installed = {
          "astro",
          "cssls",
          "cssmodules_ls",
          "html",
          "lua_ls",
          "rust_analyzer",
          "svelte",
          "tsserver",
          "yamlls",
        },
        handlers = {
          default_setup,
          yamlls = function ()
            require('lspconfig').yamlls.setup({
              capabilities = lsp_capabilities,
              settings = {
                yaml = {
                  schemas = {
                    ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                    ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                    ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                    ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                    ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                    ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                    ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                    ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                    ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                    ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                    ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
                    ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
                    --kubernetes = "*.yaml",
                  },
                }
              }
            })
          end,
          lua_ls = function()
            require('lspconfig').lua_ls.setup({
              capabilities = lsp_capabilities,
              settings = {
                Lua = {
                  runtime = {
                    version = 'LuaJIT'
                  },
                  diagnostics = {
                    globals = {'vim'},
                  },
                  workspace = {
                    library = {
                      vim.env.VIMRUNTIME,
                    }
                  }
                }
              }
            })
          end,
        }
      })

      local rt = require("rust-tools")

      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Hover actions
            vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
            -- Code action groups
            vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })

    end
  }
}
