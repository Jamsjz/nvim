-- Buffers
local map = vim.keymap.set
map({ "n", "v" }, "<leader>sx", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map({ "n", "v" }, "<leader>y", [["+y]])
map({ "n", "v" }, "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- Code runner
map("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false })
map("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true, silent = false, desc = "Rename under cursor" })
map("n", "<leader>rq", ":RunProject<CR>", { noremap = true, silent = false })
map("n", ";", ":", { noremap = true, silent = false })
map("n", "<leader>fs", ":w<CR>", { noremap = true, silent = false })

-- Wrap movement
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Bind Control + Backspace to Control + W in insert mode
vim.api.nvim_set_keymap("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })

-- Escape from insert mode
map("i", "jk", "<ESC>", { noremap = true, silent = false })

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Obsidian
vim.keymap.set("n", "gf", function()
	if require("obsidian").util.cursor_on_markdown_link() then
		return "<cmd>ObsidianFollowLink<CR>"
	else
		return "gf"
	end
end, { noremap = false, expr = true })

map("n", "<leader>nn", ":ObsidianNew ", { noremap = true, silent = false, desc = "New note" })
map("n", "<leader>nt", ":ObsidianTOC<CR>", { noremap = true, silent = false, desc = "Add TOC" })
map("n", "<leader>nd", ":ObsidianToday<CR>", { noremap = true, silent = false, desc = "Today note" })
map("n", "<leader>nsl", ":ObsidianLinks<CR>", { noremap = true, silent = false, desc = "Links" })
map("n", "<leader>nfl", ":ObsidianFollowLink<CR>", { noremap = true, silent = false, desc = "Follow link" })
map("n", "<leader>nsd", ":ObsidianDailies<CR>", { noremap = true, silent = false, desc = "Search Dailies" })
map("n", "<leader>nss", ":ObsidianSearch<CR>", { noremap = true, silent = false, desc = "Search" })
map("n", "<leader>nn", ":ObsidianQuickSwitch<CR>", { noremap = true, silent = false, desc = "Quick switch" })
map("n", "<leader>nrn", ":ObsidianRename ", { noremap = true, silent = false, desc = "Rename note" })
-- undo tree
map(
	"n",
	"<leader>j",
	":UndotreeToggle<CR>:UndotreeFocus<CR>",
	{ noremap = true, silent = false, desc = "Toggle undo tree" }
)
