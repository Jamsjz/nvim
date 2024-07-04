
return {
  -- Configure LazyVim to load dracula
  { "ellisonleao/gruvbox.nvim", config = true, opts = ...},
  {"olimorris/onedarkpro.nvim", priority = 1000},

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark_dark",
    },
  },
}
