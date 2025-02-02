return {
	{
		"nvim-neotest/neotest",
		cmd = { "Neotest" },
		ft = { "go", "rust", "javascriptreact", "javascript", "typescript", "typescriptreact" },
		keys = {
			{ "<leader>tr", function() require("neotest").run.run() end,                                         desc = "[t]est [r]un nearest" },
			{ "<leader>td", function() require("neotest").run.run({ suite = false, strategy = "dap" }) end,      desc = "[d]ebug nearest [t]est" },
			{ "<leader>tD", function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end, desc = "Debug current file" },
			{ "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,                       desc = "[t]est run [f]ile" },
			{ "<leader>tp", function() require("neotest").output_panel.toggle() end,                             desc = "[t]est output [p]anel" },
			{ "<leader>ts", function() require("neotest").summary.toggle() end,                                  desc = "[t]est [s]ummary" },
			{ "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end,  desc = "[t]est [o]utput" },
			{ "<leader>ta", function() require("neotest").run.attach() end,                                      desc = "[t]est [a]ttach" },
			{ "<leader>tA", function() require("neotest").run.run(vim.uv.cwd()) end,                             desc = "[t]est [A]ll files" },
			{ "<leader>tS", function() require("neotest").run.run({ suite = true }) end,                         desc = "[t]est [S]uite" },
			{ "<leader>tl", function() require("neotest").run.run_last() end,                                    desc = "[t]est [l]ast" },
			{ "<leader>tt", function() require("neotest").run.stop() end,                                        desc = "[t]est [t]erminate" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
			"rouge8/neotest-rust",
			"nvim-neotest/nvim-nio",
			{ "fredrikaverpil/neotest-golang", version = "*" }
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rust"),
					require("neotest-golang")({}),
					require("neotest-jest")({
						jestCommand = "npm test --",
						env = {},
						cwd = function(path)
							return vim.fn.getcwd()
						end,
					}),
				},
			})
		end,
	},
}
