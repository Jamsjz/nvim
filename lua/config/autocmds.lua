local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end

vim.g.neovide_scale_factor = 1.0

vim.keymap.set("i", "<C-=>", function()
  change_scale_factor(1.25)
end)

vim.keymap.set("i", "<C-->", function()
  change_scale_factor(1 / 1.25)
end)
