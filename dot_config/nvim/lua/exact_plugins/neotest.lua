return {
	{
		"nvim-neotest/neotest",
		cmd = { "Neotest" },
		ft = { "go", "rust", "javascriptreact", "javascript", "typescript", "typescriptreact" },
		keys = {
			{ "<leader>tr", function() require("neotest").run.run() end,                     desc = "Run test" },
			{ "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug test" },
			{ "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,   desc = "Run current file" },
			{ "<leader>tp", "<cmd>Neotest output-panel<CR>",                                 desc = "Output panel" },
			{ "<leader>to", "<cmd>Neotest output<CR>",                                       desc = "Output" },
			{ "<leader>ts", "<cmd>Neotest summary<CR>",                                      desc = "summary" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
			"rouge8/neotest-rust",
			"nvim-neotest/nvim-nio",
			"nvim-neotest/neotest-go",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rust"),
					require("neotest-go"),
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
