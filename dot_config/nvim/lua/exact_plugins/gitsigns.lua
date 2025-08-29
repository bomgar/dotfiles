return {
	{
		"lewis6991/gitsigns.nvim",
		opts = {},
		lazy = false,
		keys = {
			{ "<leader>gb", function() require("gitsigns").blame() end,      desc = "Git blame" },
			{ "<leader>gB", function() require("gitsigns").blame_line() end, desc = "Git blame line" },
		}
	}
}
