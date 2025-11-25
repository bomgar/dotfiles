return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		lazy = false,
		keys = {
			{ "<leader>gb", function() require("gitsigns").blame() end,               desc = "Git blame" },
			{ "<leader>gp", function() require("gitsigns").preview_hunk_inline() end, desc = "Git preview hunk inline" },
			{ "<leader>gP", function() require("gitsigns").preview_hunk() end,        desc = "Git preview hunk" },
			{ "<leader>gB", function() require("gitsigns").blame_line() end,          desc = "Git blame line" },
			{ "<leader>gW", function() require("gitsigns").toggle_word_diff() end,    desc = "Git toggle word diff" },
		}
	}
}
