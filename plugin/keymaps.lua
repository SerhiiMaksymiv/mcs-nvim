local map = vim.keymap.set

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

map('n', '<leader>x', vim.cmd.Ex)
map('n', '<leader>cfp', ':let @+=expand("%")<CR>')

vim.keymap.set('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find()
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>ew', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>h', vim.diagnostic.hide)
vim.keymap.set('n', '<c-d>', '<c-d>zz', { noremap = true })
vim.keymap.set('n', '<c-u>', '<c-u>zz', { noremap = true })
vim.keymap.set('n', '<leader>ee', function() vim.diagnostic.jump({ count=1, float=true }) end, { noremap = true })

vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Toggle previous & next buffers
local stash = require("stash")
stash.setup()
vim.keymap.set('n', "<leader>,", function() stash.back() end, { silent = true })
vim.keymap.set('n', "<leader>j", function () stash.forward() end, { silent = true })
vim.keymap.set('n', "<leader>h", function () stash.print() end, { silent = true })

local ls = require("luasnip")
---@diagnostic disable-next-line
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-T", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

-- ∆˚ => Option + j/k
map("n", "∆", ":m .+1<CR>==") -- move line up(n)
map("n", "˚", ":m .-2<CR>==") -- move line down(n)

map("v", "∆", ":m '>+1<CR>gv=gv") -- move line up(v)
map("v", "˚", ":m '<-2<CR>gv=gv") -- move line down(v)
