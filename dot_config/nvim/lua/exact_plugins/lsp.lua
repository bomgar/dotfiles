return {
	{
		"b0o/SchemaStore.nvim",
		lazy = true,
		version = false, -- last release is way too old
	},
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {},
		},
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"saghen/blink.cmp",
			"neovim/nvim-lspconfig",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			local lspconfig = require("lspconfig")

			local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()

			local symbols = { Error = " ", Warn = " ", Hint = " ", Info = " ", }

			for name, icon in pairs(symbols) do
				local hl = "DiagnosticSign" .. name
				vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP actions",
				callback = function(event)
					local opts = { buffer = event.buf }

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
								vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled(filter),
									filter)
							end,
							desc = "toggle inlay hints"
						},
						{ "<leader>.", vim.lsp.buf.code_action, desc = "code action (lsp)" },

					})

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<F3>", function() vim.lsp.buf.format({ async = true }) end, opts)

					vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
				end,
			})

			require("mason").setup({})

			require("mason-lspconfig").setup({
				automatic_installation = false,
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
					"zls"
				},
				handlers = {
					-- to disable add a handler that does nothing
					function(server_name) -- default handler (optional)
						lspconfig[server_name].setup {
							capabilities = lsp_capabilities,
						}
					end,
					jsonls = function()
						lspconfig.jsonls.setup({
							capabilities = lsp_capabilities,
							-- lazy-load schemastore when needed
							on_new_config = function(new_config)
								new_config.settings.json.schemas = new_config.settings.json.schemas or {}
								vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
							end,
							settings = {
								json = {
									format = {
										enable = true,
									},
									validate = { enable = true },
								},
							},
						})
					end,
					yamlls = function()
						lspconfig.yamlls.setup({
							capabilities = lsp_capabilities,
							-- lazy-load schemastore when needed
							on_new_config = function(new_config)
								new_config.settings.yaml.schemas = vim.tbl_deep_extend(
									"force",
									new_config.settings.yaml.schemas or {},
									require("schemastore").yaml.schemas()
								)
							end,
							settings = {
								redhat = { telemetry = { enabled = false } },
								yaml = {
									keyOrdering = false,
									format = {
										enable = true,
									},
									validate = true,
									schemaStore = {
										-- Must disable built-in schemaStore support to use
										-- schemas from SchemaStore.nvim plugin
										enable = false,
										-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
										url = "",
									},
								},
							},
						})
					end,
					lua_ls = function()
						lspconfig.lua_ls.setup({
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
						lspconfig.gopls.setup({
							capabilities = lsp_capabilities,
							settings = {
								gopls = {
									analyses = {
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
				},
			})
		end,
	},
}
