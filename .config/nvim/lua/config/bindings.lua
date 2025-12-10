-- vim:ft=lua
-- nvim/lua/config/options.lua
-- @author nate zhou
-- @since 2025

vim.g.mapleader = ' '


local function map(mode, keys, value)
	vim.keymap.set(mode, keys, value, { noremap = true })
end

-- escape terminal mode with vi mode shell
map('t', '<leader><Esc>', '<C-\\><C-n>')

map('n', 'W', ':w |e<Left><Left>')
map('n', '<leader>q', ':quit<CR>')

map('n', '<leader>;', ':!') -- run shell commands

map('n', 'c', '"_c') -- Don't copy to clipboard with `c*`

-- completion
map('i', '<C-f>', '<C-x><C-f>') -- start pathname suggestion
-- <Tab> to accept focused suggestion
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "<C-y>" : "<Tab>"', { expr = true, noremap = true })

-- split
map('n', '<leader>s', ':split<CR>')
map('n', '<leader>v', ':vsplit<CR>')
-- movement
map('n', '<C-h>', ':wincmd h<CR>')
map('n', '<C-j>', ':wincmd j<CR>')
map('n', '<C-k>', ':wincmd k<CR>')
map('n', '<C-l>', ':wincmd l<CR>')
-- position
map('n', '<C-w>h', ':wincmd H<CR>')
map('n', '<C-w>j', ':wincmd J<CR>')
map('n', '<C-w>k', ':wincmd K<CR>')
map('n', '<C-w>l', ':wincmd L<CR>')
-- resize
map('n', '<C-w>y', ':vertical resize -2<CR>')
map('n', '<C-w>u', ':resize +2<CR>')
map('n', '<C-w>i', ':resize -2<CR>')
map('n', '<C-w>o', ':vertical resize +2<CR>')

-- tab
map('n', '<leader>o', ':tabnew<CR>')
map('n', '<leader>j', ':tabnext<CR>')
map('n', '<leader>k', ':tabprev<CR>')

-- toggle editor visuals
map('n', '<leader>ts', ':set spell!<CR>')
map('n', '<leader>tw', ':set wrap!<CR>')
map('n', '<leader>tc', ':set cursorcolumn!<CR>')
map('n', '<leader>th', ':set hlsearch!<CR>')

map('n', '<leader>f', ':FZF<CR>')
