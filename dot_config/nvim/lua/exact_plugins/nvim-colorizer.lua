return {
	{
		"catgoose/nvim-colorizer.lua",
		opts = {
			options = {
				suppress_deprecation = true,
				parsers = {
					names = { enable = true },
					css = true
				},
				display = {
					mode = "virtualtext",
					virtualtext = { position = "after" },
				},
			}
		}
	}
}
