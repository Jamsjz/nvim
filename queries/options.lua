-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- UI
vim.opt.termguicolors = true
vim.opt.completeopt = "menu,menuone,noselect"
vim.o.pumheight = 10
vim.o.cmdheight = 1
vim.o.exrc = true
--tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- smartindent
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.colorcolumn = "90"
vim.opt.updatetime = 50

vim.o.clipboard = "unnamedplus"
-- Update and backups
vim.o.showmode = false
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 300
vim.o.timeoutlen = 100
-- Backspace key
vim.o.backspace = "indent,eol,start"
-- Get the current 'iskeyword' setting
vim.opt.iskeyword = "@,48-57,65-90,97-122"

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.wrap = true
    vim.opt.linebreak = true
  end,
})
vim.opt.spelllang = "en_us"

-- Neovide
vim.g.neovide_transparency = 0.8

vim.opt.conceallevel = 2
vim.opt.concealcursor = "nc"
vim.cmd("language en_US.utf8")
vim.opt.cursorline = true
vim.opt.scrolloff = 50

-- Shell
vim.o.shell = "/usr/bin/fish"
