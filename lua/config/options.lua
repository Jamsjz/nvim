vim.cmd("let g:netrw_liststyle = 3")
local opt = vim.opt
-- UI
opt.termguicolors = true
opt.guicursor = "n:block,i:block,v:block,c:cursor"
vim.o.pumheight = 10
vim.o.cmdheight = 1

-- Get the current 'iskeyword' setting
opt.iskeyword = "@,48-57,65-90,97-122"

--tab
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- smartindent
opt.smartindent = true
opt.swapfile = false
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.colorcolumn = "90"
opt.updatetime = 50

-- opt.clipboard = "unnamedplus"
-- Update and backups
opt.showmode = false
opt.backup = false
opt.writebackup = false
opt.updatetime = 300
opt.timeoutlen = 100
-- Backspace key
opt.backspace = "indent,eol,start"

opt.spelllang = "en_us"

-- Neovide
vim.g.neovide_transparency = 0.8

opt.conceallevel = 2
opt.concealcursor = "nc"
vim.cmd("language en_US.utf8")
opt.cursorline = true
opt.scrolloff = 10
opt.wrap = false

-- fold options
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldtext = ""
opt.foldlevel = 2
opt.foldlevelstart = 4
opt.foldnestmax = 4
-- search settings
opt.smartcase = true -- if you include mixed case in your search, assusmes you want case-sensitive

opt.background = "dark" -- colorschemes that can be light or dark will me made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- split windows
opt.splitright = true -- split vertical windows to the right
opt.splitbelow = true -- split horizontal windows to the buttom

-- Update and backups
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 500

-- mouse
-- vim.opt.mouse = ""

vim.lsp.set_log_level("debug")

--NOTE: [disable supermaven on startup]
-- vim.g.supermaven_disable = true

-- Shell
opt.shell = "/home/viola/.nix-profile/bin/zsh"
