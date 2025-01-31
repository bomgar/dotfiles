return {

	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					disabled_filetypes = { statusline = { "dashboard", "snacks_dashboard" } },
				}
			})
		end,
	},
}
