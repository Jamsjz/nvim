-- Options --
local opt = vim.opt
opt.winborder = "rounded"
opt.tabstop = 2
opt.cursorcolumn = false
opt.ignorecase = true
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.wrap = false
opt.number = true
opt.relativenumber = true
opt.swapfile = false
opt.termguicolors = true
opt.undofile = true
opt.incsearch = true
opt.signcolumn = "yes"
opt.colorcolumn = "90"
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


-- colors
vim.cmd("colorscheme monokai-pro")
vim.cmd(":hi statusline guibg=NONE")
vim.o.completeopt = "noinsert"
vim.g.clipboard = {
	name = 'win32yank',
	copy = {
		['+'] = 'win32yank.exe -i --crlf',
		['*'] = 'win32yank.exe -i --crlf',
	},
	paste = {
		['+'] = 'win32yank.exe -o --lf',
		['*'] = 'win32yank.exe -o --lf',
	},
	cache_enabled = 0,
}
