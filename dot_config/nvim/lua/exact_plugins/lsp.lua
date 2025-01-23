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
						{ "<leader>.", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "code action (lsp)" },

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
					"vtsls",
					"yamlls",
					"zls"
				},
				handlers = {
					bashls = function()
						require("lspconfig").bashls.setup({
							capabilities = lsp_capabilities,
						})
					end,
					helm_ls = function()
						require("lspconfig").helm_ls.setup({
							capabilities = lsp_capabilities,
						})
					end,
					pyright = function()
						require("lspconfig").pyright.setup({
							capabilities = lsp_capabilities,
						})
					end,
					zls = function()
						require("lspconfig").zls.setup({
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
					jsonls = function()
						require("lspconfig").jsonls.setup({
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
						require("lspconfig").yamlls.setup({
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
