vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.py",
	callback = function()
		vim.cmd("w!")
		vim.cmd("silent !black %")
		vim.cmd("edit!")
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})

