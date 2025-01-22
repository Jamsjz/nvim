vim.loader.enable()

-- Autocommand to temporarily change 'blade' filetype to 'php' when opening for LSP server activation
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = vim.api.nvim_create_augroup("lsp_blade_workaround", { clear = true }),
  pattern = "*.blade.php",
  callback = function()
    vim.bo.filetype = "php"
  end,
})

-- Markdown
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt.wrap = true
    vim.opt.linebreak = true
  end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--PHP
vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    -- Attach the LSP to the buffer
    vim.cmd("LspStart intelephense")
    vim.cmd("LspStart html")
    vim.cmd("LspStart htmx")
    vim.opt.iskeyword:append("$")

    -- Allow luasnip to extend to PHP
    require("luasnip").filetype_extend("php", { "html" })
  end,
})

-- Additional autocommand to switch back to 'blade' after LSP has attached
vim.api.nvim_create_autocmd("LspAttach", {
  pattern = "*.blade.php",
  callback = function(args)
    vim.schedule(function()
      for _, client in ipairs(vim.lsp.get_active_clients()) do
        if client.name == "intelephense" and client.attached_buffers[args.buf] then
          vim.cmd([[
                set filetype=blade
                set syntax=blade
            ]])
          break
        end
      end
    end)
  end,
})
