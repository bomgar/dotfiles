return {

	-- showing keybindings
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			local which_key = require("which-key")
			which_key.setup({
				preset = "helix",
			})
			which_key.add({
				mode = { "v" },
				{ "<leader>f",  group = "find" },
				{ "<leader>h",  group = "help" },
				{ "<leader>h?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)", },
				{ "<leader>hg", function() require("which-key").show({ global = true }) end,  desc = "Global Keymaps (which-key)", },
			})
			which_key.add({
				{ "<leader>h?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)", },
				{ "<leader>hg", function() require("which-key").show({ global = true }) end,  desc = "Global Keymaps (which-key)", },
				{ "<leader>qo", "<cmd>copen<CR>",                                             desc = "open" },
				{ "<leader>qc", "<cmd>cclose<CR>",                                            desc = "close" },
				{ "<leader>qn", "<cmd>cnext<CR>",                                             desc = "next" },
				{ "<leader>qp", "<cmd>cprevious",                                             desc = "previous" },
			})

			-- groups
			which_key.add({
				{ "<leader>h",  group = "help" },
				{ "<leader>e",  group = "browse" },
				{ "<leader>d",  group = "diffview" },
				{ "<leader>q",  group = "quickfix" },
				{ "<leader>b",  group = "debug" },
				{ "<leader>f",  group = "find" },
				{ "<leader>x",  group = "inspect" },
				{ "<leader>t",  group = "test" },
				{ "<leader>g",  group = "git" },
				{ "<leader>u",  group = "util" },
				{ "<leader>gs", group = "git search" },
			})
		end,
	},
}
