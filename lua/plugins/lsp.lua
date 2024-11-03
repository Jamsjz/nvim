return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    autoformat = true,
    servers = {
      intelephense = {
        settings = {
          intelephense = {
            format = {
              braces = "k&r",
            },
          },
        },
      },
      pyright = { -- Add Pyright configuration here
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off", -- Disable type checking
              diagnosticMode = "off", -- Disable diagnostics
            },
          },
        },
      },
    },
  },
}

-- return {
--   "neovim/nvim-lspconfig", -- REQUIRED: for native Neovim LSP integration
--   lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
--   dependencies = {
--     -- main one
--     { "ms-jpq/coq_nvim", branch = "coq" },
--
--     -- 9000+ Snippets
--     { "ms-jpq/coq.artifacts", branch = "artifacts" },
--
--     -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
--     -- Need to **configure separately**
--     { "ms-jpq/coq.thirdparty", branch = "3p" },
--   },
--   init = function()
--     require("coq_3p")({
--       { src = "nvimlua", short_name = "nLUA" },
--       { src = "vimtex", short_name = "vTEX" },
--     })
--     vim.g.coq_settings = {
--       auto_start = true,
--       display = {
--         pum = {
--           fast_close = false,
--           y_max_len = 8,
--         },
--         preview = {
--           border = {
--             { "", "NormalFloat" },
--             { "", "NormalFloat" },
--             { "", "NormalFloat" },
--             { " ", "NormalFloat" },
--             { "", "NormalFloat" },
--             { "", "NormalFloat" },
--             { "", "NormalFloat" },
--             { " ", "NormalFloat" },
--           },
--           positions = {
--             north = 1,
--             south = 2,
--             west = 3,
--             east = 4,
--           },
--         },
--         icons = {
--           mode = "long",
--         },
--       },
--     }
--   end,
--   opts = {
--     autoformat = true,
--     servers = {
--       intelephense = {
--         settings = {
--           intelephense = {
--             format = {
--               braces = "k&r",
--             },
--           },
--         },
--       },
--     },
--   },
-- }
