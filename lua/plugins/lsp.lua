local base_path = "/run/current-system/sw/bin"

return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    autoformat = true,
    servers = {
      texlab = {
        cmd = { base_path .. "/texlab" },
      },

      intelephense = {
        filetypes = { "php", "blade", "php_only" },
        settings = {
          intelephense = {
            filetypes = { "php", "blade", "php_only" },
            files = {
              associations = { "*.php", "*.blade.php" },
              maxSize = 5000000,
            },
          },
        },
      },
      html = {
        filetypes = { "html", "php", "blade", "php_only" },
        settings = {
          html = {
            filetypes = { "html", "php", "blade", "php_only" },
            files = {
              associations = { "*.html", "*.php", "*.blade.php" },
              maxSize = 5000000,
            },
          },
        },
      },
      htmx = {
        filetypes = { "html", "php", "blade", "php_only" },
        settings = {
          htmx = {
            filetypes = { "html", "php", "blade", "php_only" },
            files = {
              associations = { "*.html", "*.php", "*.blade.php" },
              maxSize = 5000000,
            },
          },
        },
      },
      -- emmet_ls = {
      --   cmd = { "emmet_ls", "--stdio" },
      -- },
      nixd = {
        cmd = { "nixd" },
        settings = {
          nixd = {
            nixpkgs = {
              expr = {
                "import <nixpkgs> { }",
              },
              formatting = {
                command = {
                  "alejandra",
                },
              },
            },
          },
        },
      },
      phpactor = {
        cmd = { base_path .. "/phpactor" },
      },
      pyright = {
        cmd = { base_path .. "/pyright-langserver", "--stdio" }, -- Add '-w' flag for watch mode
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "off",
              diagnosticMode = "workspace",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              ignore = { "*" },
            },
          },
        },
      },
      ruff = {
        cmd = { base_path .. "/ruff-lsp" },
      },
      lua_ls = {
        cmd = { base_path .. "/lua-language-server" },
      },
      gopls = {
        cmd = { base_path .. "/gopls" },
      },
      marksman = {
        cmd = { base_path .. "/marksman" },
      },
    },
  },
}
