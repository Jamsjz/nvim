return {
	"epwalsh/obsidian.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"ibhagwan/fzf-lua",
		"epwalsh/pomo.nvim",
		"hrsh7th/nvim-cmp",
		"nvim-treesitter/nvim-treesitter",
	},
	priority = 1000,
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = false,
	ft = "markdown",
	config = function()
		require("obsidian").setup({

			workspaces = {
				{
					name = "Notes",
					path = "~/notes/Obsidian-Vault-Template/Vault",
				},
			},

			daily_notes = {
				folder = "~/notes/Obsidian-Vault-Template/Vault/06 - Daily",
				template = "~/notes/Obsidian-Vault-Template/Vault/99 - Meta/00 - Templates/(TEMPLATE) Daily.md",
			},

			picker = {
				name = "telescope.nvim",
				mappings = {
					new = "<C-x>",
					insert_link = "<C-l>",
				},
			},

			sort_by = "modified",
			sort_reversed = true,

			search_max_lines = 1000,

			open_notes_in = "current",
			ui = {
				enable = true, -- set to false to disable all additional syntax features
				update_debounce = 200, -- update delay after a text change (in milliseconds)
				max_file_length = 5000, -- disable UI features for files with more than this many lines
				-- Define how various check-boxes are displayed
				checkboxes = {
					-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
					[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
					["x"] = { char = "", hl_group = "ObsidianDone" },
					[">"] = { char = "", hl_group = "ObsidianRightArrow" },
					["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
					["!"] = { char = "", hl_group = "ObsidianImportant" },
				},
				bullets = { char = "•", hl_group = "ObsidianBullet" },
				external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
				reference_text = { hl_group = "ObsidianRefText" },
				highlight_text = { hl_group = "ObsidianHighlightText" },
				tags = { hl_group = "ObsidianTag" },
				block_ids = { hl_group = "ObsidianBlockID" },
				hl_groups = {
					ObsidianTodo = { bold = true, fg = "#f78c6c" },
					ObsidianDone = { bold = true, fg = "#89ddff" },
					ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
					ObsidianTilde = { bold = true, fg = "#ff5370" },
					ObsidianImportant = { bold = true, fg = "#d73128" },
					ObsidianBullet = { bold = true, fg = "#89ddff" },
					ObsidianRefText = { underline = true, fg = "#c792ea" },
					ObsidianExtLinkIcon = { fg = "#c792ea" },
					ObsidianTag = { italic = true, fg = "#89ddff" },
					ObsidianBlockID = { italic = true, fg = "#89ddff" },
					ObsidianHighlightText = { bg = "#75662e" },
				},
			},

			attachments = {
				img_folder = "~/notes/Obsidian-Vault-Template/Vault/07 - Archives/Images/",
				---@param client obsidian.Client
				---@param path obsidian.Path
				---@return string
				img_text_func = function(client, path)
					path = client:vault_relative_path(path) or path
					return string.format("![%s](%s)", path.name, path)
				end,
				confirm_img_paste = false,
			},
			callbacks = {
				-- Runs at the end of `require("obsidian").setup()`.
				---@param client obsidian.Client
				post_setup = function(client)
					print("Obsidian.nvim is ready!")
				end,

				-- Runs anytime you enter the buffer for a note.
				---@param client obsidian.Client
				---@param note obsidian.Note
				enter_note = function(client, note) end,

				-- Runs anytime you leave the buffer for a note.
				---@param client obsidian.Client
				---@param note obsidian.Note
				leave_note = function(client, note) end,

				-- Runs right before writing the buffer for a note.
				---@param client obsidian.Client
				---@param note obsidian.Note
				pre_write_note = function(client, note) end,

				-- Runs anytime the workspace is set/changed.
				---@param client obsidian.Client
				---@param workspace obsidian.Workspace
				post_set_workspace = function(client, workspace) end,
			},
		})
	end,
}
