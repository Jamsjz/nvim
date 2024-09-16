return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"markdown",
				"markdown_inline",
				"python",
				"cpp",
				"rust",
				"bash",
				"lua",
				"html",
				"javascript",
				"typescript",
				"yaml",
				"css",
				"toml",
				"json",
				"latex",
			},
			highlight = {
				enable = true,
			},
			ignore_install = {},
			sync_install = true,
			modules = {},
			auto_install = true,
		})
	end,
}
