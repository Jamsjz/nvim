return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- @type lspconfig.options
      servers = {
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
      },
    },
  },
}
