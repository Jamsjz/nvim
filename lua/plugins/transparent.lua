return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      -- table: default groups
      groups = {
        "Comment",
        "Constant",
        "Special",
        "Identifier",
        "Statement",
        "PreProc",
        "Repeat",
        "Structure",
        "LineNr",
        "NonText",
        "StatusLine",
        "StatusLineNC",
        "EndOfBuffer",
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
}
