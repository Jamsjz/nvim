return {
  "Vigemus/iron.nvim",
  config = function()
    local iron = require("iron.core")
    local view = require("iron.view")
    local common = require("iron.fts.common")

    iron.setup({
      config = {
        scratch_repl = true,
        repl_definition = {
          sh = {
            command = { "zsh" },
          },
          python = {
            command = { "python3" },
            format = common.bracketed_paste_python,
            block_deviders = { "# %%", "#%%" },
          },
        },
        repl_filetype = function(bufnr, ft)
          return ft
        end,
        repl_open_cmd = {
          view.split.vertical.rightbelow("%40"),
        },
      },
      keymaps = {
        toggle_repl = "<space>rr",
        restart_repl = "<space>iR",
        send_motion = "<space>ic",
        visual_send = "<space>ic",
        send_file = "<space>if",
        send_line = "<space>il",
        send_paragraph = "<space>ip",
        send_until_cursor = "<space>iu",
        send_mark = "<space>im",
        send_code_block = "<space>ib",
        send_code_block_and_move = "<space>in",
        mark_motion = "<space>mc",
        mark_visual = "<space>mc",
        remove_mark = "<space>md",
        cr = "<space>s<cr>",
        interrupt = "<space>i<space>",
        exit = "<space>iq",
        clear = "<space>iL",
      },
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true,
    })
  end,
}
