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
		"neovim/nvim-lspconfig",
		config = function()
			require("lspconfig")
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
				end,
			})
		end,
	},
	{
		"mason-org/mason.nvim",
		opts = {},
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
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
				"zls"
			}
		},
		dependencies = {
			"neovim/nvim-lspconfig",
			"mason-org/mason.nvim",
		},
	}
}
