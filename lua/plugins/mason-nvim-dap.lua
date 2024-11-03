return {
  "jay-babu/mason-nvim-dap.nvim",
  dependencies = "mason.nvim",
  cmd = { "DapInstall", "DapUninstall" },
  opts = {
    automatic_setup = true,
    handlers = {
      function(config)
        require("mason-nvim-dap").default_setup(config)
      end,
      php = function(config)
        config.configurations = {
          {
            type = "php",
            request = "launch",
            name = "Listen for Xdebug",
            port = 9003,
            pathMappings = {
              ["${workspaceFolder}"] = "${workspaceFolder}",
              ["/var/www/html"] = "${workspaceFolder}",
            },
          },
        }
        require("mason-nvim-dap").default_setup(config) -- don't forget this!
      end,
    },
    ensure_installed = {
      "php",
      "bash",
      "python",
    },
  },
}
