return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		"nvim-lua/plenary.nvim",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		{
			"supermaven-inc/supermaven-nvim",
			config = function()
				require("supermaven-nvim").setup({
					keymaps = {
						accept_suggestion = "<C-y>",
						clear_suggestion = "<C-]>",
						accept_word = "<C-j>",
					},
					ignore_filetypes = { cpp = true },
					color = {
						suggestion_color = "#ffffff",
						cterm = 244,
					},
					log_level = "off", -- set to "off" to disable logging completely
					disable_inline_completion = false, -- disables inline completion for use with cmp
					disable_keymaps = false, -- disables built in keymaps for more manual control
				})
			end,
		},
	},
	---@param opts cmp.ConfigSchema
	opts = function(_, opts)
		table.insert(opts.sources, 1, {
			name = "codeium",
			group_index = 1,
			priority = 100,
		})
	end,

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
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")
		local vscodesnippets = require("luasnip.loaders.from_vscode")

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
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				-- ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "supermaven" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
				-- { name = "codeium" },
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

		vscodesnippets.lazy_load()
	end,
}
