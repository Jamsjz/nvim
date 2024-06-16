
return {
  -- Configure LazyVim to load dracula
{ "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
