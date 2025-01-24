vim.g.mapleader = " "
vim.g.maplocalleader = '\\'

-- Enable highlighting for lua HERE doc inside vim script
vim.g.vimsyn_embed = "l"

-- Use English as main language
vim.cmd("language en_US.UTF-8")

vim.o.encoding = "utf-8"

vim.o.autoread = true
vim.api.nvim_create_autocmd("FocusGained", {
	pattern = "*",
	command = "checktime",
})

vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	fold = "⸱",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}

vim.o.foldcolumn = "0"
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.timeoutlen = 500

vim.o.updatetime = 500

vim.o.swapfile = false

vim.o.cursorline = true -- Enable highlighting of the current line

vim.o.guicursor =
"n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff800-blinkon500-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
--vim.o.guifont = "Monaspace Neon,Noto Sans Mono:h12"
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_floating_shadow = false
vim.g.neovide_padding_top = 2
vim.g.neovide_padding_bottom = 2
vim.g.neovide_padding_right = 2
vim.g.neovide_padding_left = 2

-- vim.o.linespace=-1

vim.o.wildignore = "*.o,*.obj,*.dylib,*.bin,*.dll,*.exe,*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**"
vim.o.wildignore = vim.o.wildignore .. "*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico,*.pyc,*.pkl,*.DS_Store"
vim.o.wildignore = vim.o.wildignore .. "*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv"
vim.o.wildignorecase = true

local backupdir = vim.fn.stdpath("data") .. "/backup//"
vim.o.backupdir = backupdir
vim.o.backupskip = vim.o.wildignore
vim.o.backup = true
vim.o.backupcopy = "yes"

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.o.spelllang = "en_us"
vim.o.spell = false

vim.o.nu = true

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.inccommand = "nosplit"

vim.o.fileencoding = "utf-8"
vim.o.fileencodings = "ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1"

vim.o.linebreak = true
vim.o.showbreak = "↪"

vim.o.wildmode = "list:longest"

vim.o.scrolloff = 8
vim.o.sidescrolloff = 8

vim.o.fileformats = "unix,dos"

vim.o.confirm = true

vim.o.visualbell = true
vim.o.errorbells = false

vim.o.history = 500

vim.o.list = false
vim.o.listchars = "tab:▸ ,extends:❯,precedes:❮,nbsp:␣,eol:¶"

vim.o.autowrite = true

vim.o.undofile = true


vim.o.showmatch = true

vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.shortmess = vim.o.shortmess .. "S"
vim.o.shortmess = vim.o.shortmess .. "I"

vim.o.completeopt = "menuone"

vim.o.pumheight = 10
vim.o.pumblend = 10

vim.o.complete = "kspell"

vim.o.shiftround = true

vim.o.virtualedit = "block"

vim.o.formatoptions = vim.o.formatoptions .. "mM"

vim.o.tildeop = false

vim.o.startofline = false

if vim.fn.executable("rg") then
	vim.o.grepprg = "rg --vimgrep --no-heading --smart-case"
	vim.o.grepformat = "%f:%l:%c:%m"
end

vim.o.termguicolors = true

vim.o.diffopt = "vertical,filler,closeoff,context:3,internal,indent-heuristic,algorithm:histogram,linematch:60"

vim.o.wrap = false

vim.o.ruler = false

vim.o.showmode = false

vim.filetype.add({
	extension = {
		templ = "templ",
	},
})

-- Enable the title setting
vim.o.title = true

-- Set the title to the current directory name
vim.o.titlestring = "%{fnamemodify(getcwd(), ':t')}"


vim.api.nvim_create_autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 300 })
	end
})

vim.o.smoothscroll = true
