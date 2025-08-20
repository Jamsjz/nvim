local Pick = require("mini.pick")

local map = vim.keymap.set

local function delete_other_buffers()
	local current_buf = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= current_buf then
			vim.api.nvim_buf_delete(buf, { force = false })
		end
	end
end


local pick_lsp_symbols = function()
	local picker_func = Pick.registry.labeled_lsp or function(local_opts, opts)
		require("mini.extra").pickers.lsp({ scope = "document_symbol" }, { label = true })
	end
	picker_func({}, {})
end

vim.g.mapleader = " "

map('n', '<leader>S', ':update<CR> :source<CR>', { desc = '[S]ave and source config' })
map('n', '<leader>fs', ':write<CR>', { desc = '[F]ile [S]ave' })
map({ 'n', 'v', 'x' }, '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
map({ 'n', 'v', 'x' }, '<leader>d', '"+d', { desc = '[D]elete to system clipboard' })
map('n', '<leader><leader>', ":Pick files<CR>", { desc = '[P]ick [F]iles (double leader)' })
map('n', '<leader>sf', ":Pick files<CR>", { desc = '[S]earch [F]iles' })
map('n', '<leader>sh', ":Pick help<CR>", { desc = '[S]earch [H]elp' })
map('n', '<leader>sc', ":Pick commands<CR>", { desc = '[S]earch [C]ommands' })
map('n', '<leader>sk', ":Pick keymaps<CR>", { desc = '[S]earch [K]eymaps' })
map('n', '<leader>s/', ":Pick grep_live<CR>", { desc = '[S]earch [/] Live grep' })
map('n', '<leader>gsc', ":Pick git_commits<CR>", { desc = '[G]it [S]earch [C]ommits' })
map('n', '<leader>gsb', ":Pick git_branches<CR>", { desc = '[G]it [S]earch [B]ranches' })
map('n', '<leader>gsf', ":Pick git_files<CR>", { desc = '[G]it [S]earch [F]iles' })
map('n', '<leader>/', ":Pick grep_live<CR>", { desc = '[S]earch live grep' })
map('n', '<leader>.', ":Pick buffers<CR>", { desc = '[S]earch [B]uffers' })
map('n', '<leader>cf', vim.lsp.buf.format, { silent = true, desc = '[C]ode [F]ormat' })
map('n', '<leader>cd', vim.diagnostic.open_float, { desc = '[C]ode [D]iagnostics' })
map('n', 'H', ':bprevious<cr>', { desc = 'Go to previous buffer' })
map('n', 'L', ':bnext<cr>', { desc = 'Go to next buffer' })
map('n', '<leader>bd', ':bdelete<cr>', { desc = '[B]uffer [D]elete' })

map('n', '<leader>bo', delete_other_buffers, { desc = '[B]uffer delete [O]thers except current' })
map('i', 'C-BS', 'C-w')
map('n', '<ESC>', '<cmd>nohlsearch<cr>', { silent = true, desc = 'Clear search highlights' })
map('n', "<leader>p", ":PasteImage<cr>", { desc = '[P]aste image' })
map('n', '<leader>uw', ':set wrap!<CR>', { desc = '[U]n/wrap [W]rap (toggle line wrap)' })
map('n', '<leader>uc', ":Pick colorschemes<CR>", { desc = '[U]ser [C]olorschemes pick' })
map('n', 'C-u', "zzC-uzz")
map('n', 'C-d', "zzC-dzz")


map("n", "<leader>cs", "", { callback = pick_lsp_symbols, desc = "Pick LSP document symbols" })

map('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
map('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
map('n', '<leader>crf', ':CRFiletype<CR>', { noremap = true, silent = false })
map('n', '<leader>crp', ':CRProjects<CR>', { noremap = true, silent = false })
map('n', "<leader>fo", ":Oil<cr>", { desc = "Open [O]il file manager" })
map('n', "-", ":lua MiniFiles.open()<cr>", { desc = "Open Minifiles" })
map('n', '<leader>D', ':DBUI<cr>', { desc = "Data Bod" })
map('n', '<leader>gg', ':LazyGit<cr>', { desc = "Data Bod" })
map('n', '<leader>w', 'C-w', { desc = "[W]indows" })
local opts = { silent = true, noremap = true }
map('n', '<C-Up>', '<cmd>resize +2<CR>', opts)
map('n', '<C-Down>', '<cmd>resize -2<CR>', opts)
map('n', '<C-Left>', '<cmd>vertical resize -2<CR>', opts)
map('n', '<C-Right>', '<cmd>vertical resize +2<CR>', opts)
