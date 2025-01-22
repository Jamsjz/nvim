local base_path = "/run/current-system/sw/bin"

return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    autoformat = true,
    servers = {
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
      htmx = {
        cmd = { base_path .. "/htmx-lsp" },
      },
      marksman = {
        cmd = { base_path .. "/marksman" },
      },
    },
  },
}
