-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Buffers
local Util = require("lazyvim.util")
local function amap(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

amap("n", "<leader>gd",
  function()
    Util.float_term({ "lazydocker", "-f", Util.get_root() .. "docker-compose.yml" },
      { cwd = Util.get_root(), esc_esc = false })
  end,
  { desc = "LazyDocker (root dir)" })

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

-- undo tree
map(
  "n",
  "<leader>j",
  ":UndotreeToggle<CR>:UndotreeFocus<CR>",
  { noremap = true, silent = false, desc = "Toggle undo tree" }
)

map("n", "<C-D>", "<C-D>zz", { noremap = true, silent = false })
map("n", "<C-U>", "<C-U>zz", { noremap = true, silent = false })
