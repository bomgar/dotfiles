local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- configuration for lazy itself.
local lazy_opts = {
	ui = {
		border = "rounded",
		title = "Plugin Manager",
		title_pos = "center",
	},
}

require("lazy").setup("plugins", lazy_opts)
