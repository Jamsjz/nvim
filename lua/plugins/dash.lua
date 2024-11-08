local Util = require("lazyvim.util")
return {
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = [[


     ____.  _____      _____    _________    __
    |    | /  _  \    /     \  /   _____/   |__|_______
    |    |/  /_\  \  /  \ /  \ \_____  \    |  \___   /
/\__|    /    |    \/    Y    \/        \   |  |/    /
\________\____|__  /\____|__  /_______  /\__|  /_____ \
                 \/         \/        \/\______|     \/


     ]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
center = {
    { action = [[lua require("fzf-lua").files()]],                             desc = " Find file",       icon = " ", key = "f" },
    { action = "ene | startinsert",                                            desc = " New file",        icon = " ", key = "n" },
    { action = [[lua require("fzf-lua").oldfiles()]],                          desc = " Recent files",    icon = " ", key = "r" },
    { action = [[lua require("fzf-lua").live_grep()]],                         desc = " Find text",       icon = " ", key = "g" },
    { action = [[lua require("lazyvim.util").pick.config_files()()]],          desc = "Config",           icon = " ", key = "c" },
    { action = 'lua require("persistence").load()',                            desc = " Restore Session", icon = " ", key = "s" },
    { action = "LazyExtras",                                                   desc = " Lazy Extras",     icon = " ", key = "x" },
},
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            -- return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
            return { "Hello World!" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
}
