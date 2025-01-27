return {

  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "habamax",
  --   },
  -- },
  -- {
  --   "notken12/base46-colors",
  -- },

  {
    "bluz71/vim-moonfly-colors",
    priority = 1000,
    config = function()
      -- Set global variables for transparency and terminal colors
      vim.g.moonflyTransparent = false
      vim.g.moonflyTerminalColors = true
      -- Apply the colorscheme
      vim.cmd("colorscheme moonfly")
      vim.g.moonflyCursorColor = true
      vim.g.moonflyItalics = false
      vim.g.moonflyNormalFloat = true
      vim.g.moonflyUndercurls = false
      vim.g.moonflyUnderlineMatchParen = true
      vim.g.moonflyVirtualTextColor = true
      vim.g.moonflyWinSeparator = 2
    end,
  },
}
