return {
	{
		"mistweaverco/kulala.nvim",
		ft = { "http", "rest" },
		opts = {
			-- your configuration comes here
			global_keymaps = true,
			ui = {
				---@type table<string, string|vim.api.keyset.highlight>
				syntax_hl = {
					["@variable.kulala_http"] = "@variable",
				},
			}
		},
	},
}
