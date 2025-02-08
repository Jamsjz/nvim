return {
  {
    "mg979/vim-visual-multi",
  },
  {
    "ThePrimeagen/vim-be-good",
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      require("transparent").setup({
        -- table: default groups
        groups = {
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
        },
        -- table: additional groups that should be cleared
        extra_groups = {},
        -- table: groups you don't want to clear
        exclude_groups = {},
        -- function: code to be executed after highlight groups are cleared
        -- Also the user event "TransparentClear" will be triggered
        on_clear = function() end,
      })
      require("transparent").clear_prefix("NeoTree")
    end,
  },
  {
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
        vim.g.moonflyItalics = true
        vim.g.moonflyNormalFloat = true
        vim.g.moonflyUndercurls = true
        vim.g.moonflyUnderlineMatchParen = true
        vim.g.moonflyVirtualTextColor = true
        vim.g.moonflyWinSeparator = 2
      end,
    },
    {
      "notken12/base46-colors",
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  { "voldikss/vim-floaterm" },
}
