return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-emoji",
      "uga-rosa/cmp-dictionary",
      -- "hrsh7th/cmp-path",
      "hrsh7th/cmp-calc",
      "windwp/nvim-autopairs",
      "jcha0713/cmp-tw2css",
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "nvim-lua/plenary.nvim",
      "L3MON4D3/LuaSnip",
      {
        "L3MON4D3/cmp-luasnip-choice",
        config = function()
          require("cmp_luasnip_choice").setup({ auto_open = true })
        end,
      },
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "crazyhulk/cmp-sign",
      "onsails/lspkind.nvim",
      "supermaven-inc/supermaven-nvim",
      "FelipeLema/cmp-async-path",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "mtoohey31/cmp-fish",
      "roginfarrer/cmp-css-variables",
    },
    formatting = {
      format = function(entry, vim_item)
        if entry.source.name == "html-css" then
          vim_item.menu = entry.completion_item.menu
        end
        return vim_item
      end,
    },

    keys = {
      {
        "<tab>",
        function()
          return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
        end,
        expr = true,
        silent = true,
        mode = "i",
      },
      {
        "<tab>",
        function()
          require("luasnip").jump(1)
        end,
        mode = "s",
      },
      {
        "<s-tab>",
        function()
          require("luasnip").jump(-1)
        end,
        mode = { "i", "s" },
      },
    },

    config = function()
      local cmp = require("cmp")
      local vscodesnippets = require("luasnip.loaders.from_vscode")
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")
      local s = luasnip.snippet
      local t = luasnip.text_node
      local i = luasnip.insert_node
      luasnip.filetype_extend("blade", { "html", "php" })
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect",
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          -- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "blade-nav", priority = 1000 },
          { name = "luasnip", priority = 900 },
          { name = "nvim_lsp", priority = 800 },
          { name = "supermaven", priority = 700 },
          { name = "async_path", priority = 400 },
          { name = "nvim_cmp_sign", priority = 300 },
          { name = "nvim_lsp_document_symbol", priority = 300 },
          { name = "nvim_lsp_signature_help", priority = 300 },
          { name = "html-css", priority = 600 },
          { name = "calc", priority = 200 },
          { name = "nvim_lsp_document_symbol", priority = 200 },
          { name = "dictionary", keyword_length = 2, priority = 200 },
          { name = "fish", option = { fish_path = "/usr/bin/fish" }, priority = 200 },
          { name = "emoji", priority = 200 },
          { name = "css-variables", priority = 200 },
          { name = "cmp_tw2css", priority = 200 },
        }, {
          { name = "buffer", priority = 200 },
        }),
        formatting = {
          format = lspkind.cmp_format({ with_text = true, maxwidth = 50 }),
        },
      })

      cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
          { name = "cmp_git" },
        }, {
          { name = "buffer" },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    end,
    enabled = true,
  },
}
