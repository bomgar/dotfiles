vim.g.mapleader = " "
vim.g.maplocalleader = '\\'

-- Enable highlighting for lua HERE doc inside vim script
vim.g.vimsyn_embed = "l"

-- Use English as main language
vim.cmd("language en_US.UTF-8")

local opt = vim.opt

opt.encoding = "utf-8"

opt.autoread = true

vim.api.nvim_create_autocmd("FocusGained", {
	pattern = "*",
	command = "checktime",
})

opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = "⸱",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

opt.foldcolumn = "0"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.foldenable = true

opt.splitbelow = true
opt.splitright = true

opt.timeoutlen = 500

opt.updatetime = 500

opt.swapfile = false

opt.cursorline = true -- Enable highlighting of the current line

vim.o.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff800-blinkon500-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_floating_shadow = false
vim.g.neovide_padding_top = 2
vim.g.neovide_padding_bottom = 2
vim.g.neovide_padding_right = 2
vim.g.neovide_padding_left = 2

-- vim.o.linespace=-1

opt.wildignore = "*.o,*.obj,*.dylib,*.bin,*.dll,*.exe,*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**"
opt.wildignore = vim.o.wildignore .. "*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico,*.pyc,*.pkl,*.DS_Store"
opt.wildignore = vim.o.wildignore .. "*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv"
opt.wildignorecase = true

local backupdir = vim.fn.stdpath("data") .. "/backup//"
opt.backupdir = backupdir
opt.backupskip = vim.o.wildignore
opt.backup = true
opt.backupcopy = "yes"

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

if not vim.g.vscode then
	opt.spelllang = "en_us"
	opt.spell = false
end

opt.nu = true

opt.ignorecase = true
opt.smartcase = true

opt.inccommand = "nosplit"

opt.fileencoding = "utf-8"
opt.fileencodings = "ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"

opt.linebreak = true
opt.showbreak = "↪"

opt.wildmode = "list:longest"

opt.scrolloff = 5

opt.fileformats = "unix,dos"

opt.confirm = true

opt.visualbell = true
opt.errorbells = false

opt.history = 500

opt.list = false
opt.listchars = "tab:▸ ,extends:❯,precedes:❮,nbsp:␣,eol:¶"

opt.autowrite = true

opt.undofile = true

opt.shortmess = vim.o.shortmess .. "c"

opt.showmatch = true

opt.shortmess = vim.o.shortmess .. "S"

opt.shortmess = vim.o.shortmess .. "I"

opt.completeopt = "menuone"

opt.pumheight = 10
opt.pumblend = 10

opt.complete = "kspell"

opt.shiftround = true

opt.virtualedit = "block"

opt.formatoptions = vim.o.formatoptions .. "mM"

opt.tildeop = false

opt.startofline = false

if vim.fn.executable("rg") then
	opt.grepprg = "rg --vimgrep --no-heading --smart-case"
	opt.grepformat = "%f:%l:%c:%m"
end

opt.termguicolors = true

opt.diffopt = "vertical,filler,closeoff,context:3,internal,indent-heuristic,algorithm:histogram,linematch:60"

opt.wrap = false

opt.ruler = false

opt.showmode = false

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

-- Enable the title setting
opt.title = true

-- Set the title to the current directory name
opt.titlestring = "%{fnamemodify(getcwd(), ':t')}"


vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 300 })
	end
})

opt.smoothscroll = true
