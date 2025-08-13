-- Lazy --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out,                            "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "https://github.com/stevearc/oil.nvim" },
		{
			"folke/which-key.nvim",
			event = "VeryLazy",
		},
		{ "https://github.com/echasnovski/mini.nvim" },
		{ "https://github.com/nvim-treesitter/nvim-treesitter" },
		{ "https://github.com/kaarmu/typst.vim.git" },
		{
			"https://github.com/chomosuke/typst-preview.nvim",
			opts = {
				-- dependencies_bin = {
				-- 	['tinymist'] = "/run/current-system/sw/bin/tinymist",
				-- 	['websocat'] = "/run/current-system/sw/bin/websocat"
				-- },
				open_cmd = "google-chrome --new-window %s --class typst-preview",
				invert_colors = "always"
			}
		},
		{ "https://github.com/morhetz/gruvbox.git" },
		{ "https://github.com/folke/tokyonight.nvim.git" },
		{ "https://github.com/hakonharnes/img-clip.nvim.git" },
		{ "https://github.com/neovim/nvim-lspconfig.git" },
		{
			'https://github.com/saghen/blink.cmp',
			version = '1.*',
			dependencies = {
				{ "https://github.com/L3MON4D3/LuaSnip", opts = { enable_autosnippets = true } },
				'rafamadriz/friendly-snippets',
				"tpope/vim-dadbod",
				"kristijanhusak/vim-dadbod-completion",
				"kristijanhusak/vim-dadbod-ui",
			},
		},
		{ "CRAG666/code_runner.nvim", config = true },
		{ "lewis6991/gitsigns.nvim",  opts = { current_line_blame = true, }, },
		{"https://github.com/kdheepak/lazygit.nvim.git"}
	},
	checker = { enabled = true },
})

require "cmp"
require "min"
