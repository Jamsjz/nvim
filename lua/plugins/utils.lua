return {
  -- CODE RUNNER
  {
    "CRAG666/code_runner.nvim",
    config = true,
    filetype = {
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt",
      },
      python = "python3 -u",
      typescript = "deno run",
      rust = {
        "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt",
      },
    },
  },

  -- COLORIZER
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      vim.o.termguicolors = true
      local colorizer = require("colorizer")

      colorizer.setup()
    end,
  },

  -- COMMENT
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
      {
        ---Add a space b/w comment and the line
        padding = true,
        ---Whether the cursor should stay at its position
        sticky = true,
        ---Lines to be ignored while (un)comment
        ignore = nil,
        ---LHS of toggle mappings in NORMAL mode
        toggler = {
          ---Line-comment toggle keymap
          line = "gcc",
          ---Block-comment toggle keymap
          block = "gbc",
        },
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = "gc",
          ---Block-comment keymap
          block = "gb",
        },
        ---LHS of extra mappings
        extra = {
          ---Add comment on the line above
          above = "gcO",
          ---Add comment on the line below
          below = "gco",
          ---Add comment at the end of line
          eol = "gcA",
        },
        ---Enable keybindings
        mappings = {
          ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
          basic = true,
          ---Extra mapping; `gco`, `gcO`, `gcA`
          extra = true,
        },
        ---Function to call before (un)comment
        pre_hook = nil,
        ---Function to call after (un)comment
        post_hook = nil,
      },
    },
    lazy = false,
  },

  -- TAGBAR
  {
    "preservim/tagbar",
  },

  -- MULTI LINE EDITING
  {
    "mg979/vim-visual-multi",
  },

  -- NOTIFY
  {

    "rcarriga/nvim-notify",

    config = function()
      vim.opt.termguicolors = true
      vim.notify = require("notify")
      local notify = require("notify")

      notify.setup({
        minimum_width = 50,
        background_colour = "#1d2021",
        stages = "fade",
        timeout = 2000,
        fps = 60,
        level = 3,
        max_width = 100,
        max_height = 100,
      })
    end,
  },

  -- TOGGLE TABBAR
  {
    "muellan/vim-toggle-ui-elements",
  },

  -- NAVIGATOR FOR TMUX PANES
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

  --SURROUND ANYTHING BY ANYTHING
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },

-- Toggle term
{
  {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}
},

}
