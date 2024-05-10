return {{
  'nvim-orgmode/orgmode',
  event = 'VeryLazy',
  ft = { 'org' },
  config = function()
    -- Setup orgmode
    require('orgmode').setup({
      org_agenda_files = '~/orgfiles/**/*',
      org_default_notes_file = '~/orgfiles/refile.org',
    })

require('nvim-treesitter.configs').setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- This line is needed
  },
  ensure_installed = {'org'},
}

    require('orgmode').setup({
  org_todo_keywords = {'TODO', 'WAITING', '|', 'DONE', 'DELEGATED'},
  org_todo_keyword_faces = {
    WAITING = ':foreground blue :weight bold',
    DELEGATED = ':background #FFFFFF :slant italic :underline on',
    TODO = ':background #000000 :foreground red', -- overrides builtin color for `TODO` keyword
  }
})

  end,},
  {
    "akinsho/org-bullets.nvim",
    config = function()
      local org_bullets = require("org-bullets")
      org_bullets.setup({
        concealcursor = false,
        symbols = {
          list = "•",
          headlines = { "◉", "○", "✸", "✿" },
          headlines_function = function(default_list)
            table.insert(default_list, "♥")
            return default_list
          end,
          checkboxes = {
            half = { "", "OrgTSCheckboxHalfChecked" },
            done = { "✓", "OrgDone" },
            todo = { "˟", "OrgTODO" },
          },
        },
      })
    end,
  },
  {"dhruvasagar/vim-table-mode"},
    {
        "lukas-reineke/headlines.nvim",
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = true, -- or `opts = {}`
    },

}
