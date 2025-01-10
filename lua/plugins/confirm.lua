local util = require("conform.util")
return {
  "stevearc/conform.nvim",
  opts = function()
    ---@type conform.setupOpts
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false, -- not recommended to change
        quiet = false, -- not recommended to change
        lsp_format = "fallback", -- not recommended to change
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        php = { "pint" },
        blade = { "blade-formatter", "rustywind" },
        python = { "black" },
        javascript = { "prettierd" },
        rust = { "rustfmt" },
      },
      -- LazyVim will merge the options you set here with builtin formatters.
      -- You can also define any custom formatters here.
      ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
      formatters = {
        injected = { options = { ignore_errors = true } },
        prettierd = {
          command = util.find_executable({
            "/run/current-system/sw/bin/prettierd",
          }),
        },
        stylua = {
          command = util.find_executable({ "/run/current-system/sw/bin/stylua" }),
        },
        pint = {
          command = util.find_executable({
            -- vim.fn.stdpath("data") .. "/mason/bin/pint",
            "./vendor/bin/pint",
          }, "pint"),
          args = { "$FILENAME" },
          stdin = false,
        },
      },
    }
    return opts
  end,
}
