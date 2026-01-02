vim.lsp.enable({
	"lua_ls",
	"tinymist",
	"emmet-language-server",
	"ts_ls",
	"eslint",
	"pyright",
	"tailwindcss",
	"html",
	"harper",
	"herb_ls",
	"ruby_lsp"
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					'vim',
					'require'
				}
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			},
		},
	},
})

vim.lsp.config("tinymist", {
	settings = {
		formatterMode = "typstyle"
	}
})
