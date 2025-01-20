return {

	-- showing keybindings
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local which_key = require("which-key")
			which_key.setup({})
			which_key.add({
				mode = { "v" },
				{ "<leader>f",  group = "find" },
				{ "<leader>h",  group = "help" },
				{ "<leader>h?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)", },
				{ "<leader>hg", function() require("which-key").show({ global = true }) end,  desc = "Global Keymaps (which-key)", },
			})
			which_key.add({
				{ "<leader>h",  group = "help" },
				{ "<leader>h?", function() require("which-key").show({ global = false }) end,    desc = "Buffer Local Keymaps (which-key)", },
				{ "<leader>hg", function() require("which-key").show({ global = true }) end,     desc = "Global Keymaps (which-key)", },
				{ "<leader>e",  group = "browse" },
				{ "<leader>ed", function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end,     desc = "Browse current directory" },
				{ "<leader>er", function() MiniFiles.open() end,                                 desc = "Browse root directory" },
				{ "<leader>d",  group = "diffview" },
				{ "<leader>q",  group = "quickfix" },
				{ "<leader>qo", "<cmd>copen<CR>",                                                desc = "open" },
				{ "<leader>qc", "<cmd>cclose<CR>",                                               desc = "close" },
				{ "<leader>qn", "<cmd>cnext<CR>",                                                desc = "next" },
				{ "<leader>qp", "<cmd>cprevious",                                                desc = "previous" },
				{ "<leader>b",  group = "debug" },
				{ "<leader>f",  group = "find" },
				{ "<leader>c",  group = "text-case" },
				{ "<leader>x",  group = "inspect" },
				{ "<leader>t",  group = "test" },
				{ "<leader>tr", function() require("neotest").run.run() end,                     desc = "Run test" },
				{ "<leader>td", function() require("neotest").run.run({ strategy = "dap" }) end, desc = "Debug test" },
				{ "<leader>tg", function() require("dap-go").debug_test() end,                   desc = "Debug go test" },
				{ "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end,   desc = "Run current file" },
				{ "<leader>tp", "<cmd>Neotest output-panel<CR>",                                 desc = "Output panel" },
				{ "<leader>to", "<cmd>Neotest output<CR>",                                       desc = "Output" },
				{ "<leader>ts", "<cmd>Neotest summary<CR>",                                      desc = "summary" },
				{ "<leader>g",  group = "git" },
				{ "<leader>u",  group = "util" },
				{ "<leader>gs", group = "git search" },
			})
		end,
	},
}
