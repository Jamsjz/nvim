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
		local clients = vim.lsp.get_clients({ bufnr = 0 })
		local bufnr = vim.api.nvim_get_current_buf()
		for _, client in pairs(clients) do
			if client.attached_buffers ~= nil and vim.tbl_contains(client.attached_buffers, bufnr) then
				if client.server_capabilities.documentFormattingProvider then
					vim.lsp.buf.format({ async = false })
					return
				end
			end
		end
	end,
})
