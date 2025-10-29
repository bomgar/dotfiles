return {
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		dependencies = { "nvim-treesitter/nvim-treesitter" }
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		branch = "main",
		lazy = false,
		config = function()
			vim.opt.foldmethod = "expr"
			vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

			local parsers ={
				"astro",
				"bash",
				"blade",
				"c",
				"css",
				"csv",
				"diff",
				"dockerfile",
				"editorconfig",
				"fish",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"groovy",
				"hcl",
				"helm",
				"hocon",
				"html",
				"http",
				"java",
				"javascript",
				"jsdoc",
				"json",
				"jsonc",
				"kdl",
				"kotlin",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"php",
				"proto",
				"python",
				"query",
				"regex",
				"ruby",
				"rust",
				"scss",
				"sql",
				"ssh_config",
				"styled",
				"svelte",
				"templ",
				"terraform",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
				"zig",
			}

			require('nvim-treesitter').install(parsers)
			vim.api.nvim_create_autocmd('FileType', {
				pattern =parsers,
				callback = function(args)
						vim.treesitter.start()
				end,
			})
		end,
	},
}
