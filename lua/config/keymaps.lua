-- Buffers
local map = vim.keymap.set
map({ "n", "v" }, "<leader>sx", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map({ "n", "v" }, "<leader>y", [["+y]])
map({ "n", "v" }, "<leader>Y", [["+Y]])
map({ "n", "v" }, "<leader>d", [["_d]])

-- Code runner
map("n", "<leader>rr", ":RunCode<CR>", { noremap = true, silent = false, desc = "Run code" })
map("n", "<leader>rq", ":RunProject<CR>", { noremap = true, silent = false })
-- Wrap movement
map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
map("n", "<C-/>", "<CMD>FloatermToggle<CR>", { desc = "Open Terminal" })
map("i", "<C-BS>", "<C-W>", { noremap = true, silent = true })
map("n", "<leader>fs", "<CMD>w<CR>")

-- undo tree
map(
  "n",
  "<leader>j",
  ":UndotreeToggle<CR>:UndotreeFocus<CR>",
  { noremap = true, silent = false, desc = "Toggle undo tree" }
)

map("n", "<C-D>", "<C-D>zz", { noremap = true, silent = false })
map("n", "<C-U>", "<C-U>zz", { noremap = true, silent = false })

-- iron also has a list of commands, see :h iron-commands for all available commands
map("n", "<space>rf", "<cmd>IronFocus<cr>")
map("n", "<space>rh", "<cmd>IronHide<cr>")
