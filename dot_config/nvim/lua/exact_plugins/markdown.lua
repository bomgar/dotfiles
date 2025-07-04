return {
	{
		'MeanderingProgrammer/render-markdown.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
		ft = { "markdown", "codecompanion" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	}
}
