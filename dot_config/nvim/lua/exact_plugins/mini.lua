return {
	{
		'echasnovski/mini.nvim',
		version = false,
		keys = {
			{ "<leader>go", function() MiniDiff.toggle_overlay() end,                    desc = "Toggle minidiff overlay" },
			{ "<leader>ed", function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end, desc = "Browse current directory" },
			{ "<leader>ec", function() MiniFiles.open() end,                             desc = "Browse cwd" },
			{ "<leader>eh", function() MiniFiles.open("~") end,                          desc = "Browse home directory" },
			{ "<leader>er", function() MiniFiles.open("/") end,                          desc = "Browse root directory" },
		},
		lazy = false,
		config = function()
			require("mini.icons").setup({})
			MiniIcons.mock_nvim_web_devicons()
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

			require("mini.files").setup({
				mappings = {
					go_in_plus = '<CR>',
				},
				windows = {
					preview = true,
					width_preview = 50,
				}
			})
			require("mini.hipatterns").setup({
				highlighters = {
					fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
					hack  = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
					todo  = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
					note  = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

				},
			})
			require("mini.splitjoin").setup({})
			require("mini.diff").setup({
				view = {
					style = "sign"
				}
			})
			local ai = require("mini.ai")
			ai.setup({
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),  -- class
					d = { "%f[%d]%d+" },                                                     -- digits
					u = ai.gen_spec.function_call(),                                         -- u for "Usage"
					U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),               -- without dot in function name
				},
			})
		end
	},
}
