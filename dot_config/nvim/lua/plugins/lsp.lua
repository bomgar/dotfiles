return {
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {},
        },
    },
    {
        "williamboman/mason.nvim",
        enabled = not vim.g.vscode,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "neovim/nvim-lspconfig",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()

            local lspconfig = require("lspconfig")

            local lsp_capabilities =
                vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), require("cmp_nvim_lsp").default_capabilities())

            vim.api.nvim_create_autocmd("LspAttach", {
                desc = "LSP actions",
                callback = function(event)
                    local opts = { buffer = event.buf }

                    local which_key = require("which-key")

                    local filter = { bufnr = event.buf }
                    which_key.add({
                        buffer = event.buf,

                        { "gd",        vim.lsp.buf.definition,                                                                      desc = "goto definition (lsp)" },
                        { "gD",        vim.lsp.buf.declaration,                                                                     desc = "goto declaration (lsp)" },
                        { "gi",        vim.lsp.buf.implementation,                                                                  desc = "goto implementation (lsp)" },
                        { "go",        vim.lsp.buf.type_definition,                                                                 desc = "goto type definition (lsp)" },
                        { "gr",        vim.lsp.buf.references,                                                                      desc = "references (lsp)" },
                        { "gs",        vim.lsp.buf.signature_help,                                                                  desc = "signature help (lsp)" },
                        { "gl",        vim.diagnostic.open_float,                                                                   desc = "open diagnostic (lsp)" },
                        { "gh",        function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter), filter) end, desc = "toggle inlay hints" },
                        { "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>",                                                    desc = "code action (lsp)" },

                    })

                    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
                    vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
                    vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)

                    vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
                    vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
                end,
            })

            require("mason").setup({})

            require("mason-lspconfig").setup({
                ensure_installed = {
                    "astro",
                    "cssls",
                    "cssmodules_ls",
                    "gopls",
                    "html",
                    "lua_ls",
                    "rust_analyzer",
                    "svelte",
                    "vtsls",
                    "yamlls",
                    "bashls",
                    "templ",
                    "pyright",
                },
                handlers = {
                    bashls = function()
                        require("lspconfig").bashls.setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    pyright = function()
                        require("lspconfig").pyright.setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    templ = function()
                        require("lspconfig").templ.setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    astro = function()
                        require("lspconfig").astro.setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    cssls = function()
                        require("lspconfig").cssls.setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    cssmodules_ls = function()
                        require("lspconfig").cssmodules_ls.setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    html = function()
                        require("lspconfig").html.setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    svelte = function()
                        require("lspconfig").svelte.setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    vtsls = function()
                        require("lspconfig").vtsls.setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                    yamlls = function()
                        require("lspconfig").yamlls.setup({
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
                                        ["https://json.schemastore.org/dependabot-2.0.json"] = ".github/dependabot.{yml,yaml}",
                                        ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] =
                                        "*gitlab-ci*.{yml,yaml}",
                                        ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                                        ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
                                        "*docker-compose*.{yml,yaml}",
                                        ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
                                        --kubernetes = "*.yaml",
                                    },
                                },
                            },
                        })
                    end,
                    lua_ls = function()
                        require("lspconfig").lua_ls.setup({
                            capabilities = lsp_capabilities,
                            settings = {
                                Lua = {
                                    runtime = {
                                        version = "LuaJIT",
                                    },
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                    workspace = {
                                        library = {
                                            vim.env.VIMRUNTIME,
                                        },
                                    },
                                },
                            },
                        })
                    end,
                    gopls = function()
                        require("lspconfig").gopls.setup({
                            capabilities = lsp_capabilities,
                            settings = {
                                gopls = {
                                    analyses = {
                                        fieldalignment = true,
                                        nilness = true,
                                        unusedparams = true,
                                        unusedwrite = true,
                                        useany = true,
                                    },
                                    usePlaceholders = true,
                                    semanticTokens = true,
                                    hints = {
                                        assignVariableTypes = true,
                                        compositeLiteralFields = true,
                                        compositeLiteralTypes = true,
                                        constantValues = true,
                                        functionTypeParameters = true,
                                        parameterNames = true,
                                        rangeVariableTypes = true,
                                    },
                                },
                            },
                        })
                    end,
                    rust_analyzer = function()
                        require("lspconfig").rust_analyzer.setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                },
            })
        end,
    },
}
