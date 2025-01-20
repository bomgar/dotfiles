return {
	{
		"bomgar/rage.nvim",
		keys = {
			{ "<leader>fr", function() require("rage").rage() end, desc = "rage" }
		}
	}
}
