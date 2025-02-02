return {

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			options = {
				theme = "auto",
				disabled_filetypes = { statusline = { "dashboard", "snacks_dashboard" } },
			},
		}
	},
}
