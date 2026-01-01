-- vim:ft=lua
-- nvim/lua/config/options.lua
-- @author nate zhou
-- @since 2025,2026

vim.g.mapleader = ' '

local function map(mode, keys, value)
	vim.keymap.set(mode, keys, value, { noremap = true })
end

-- escape terminal mode with vi mode shell
map('t', '<leader><ESC>', '<C-\\><C-n>')
map('t', '<leader>q', '<C-\\><C-n> | :quit!<CR>')
map('t', '<C-q>', '<C-\\><C-n> | :quit!<CR>')

map('n', '<leader><CR>', ':split | terminal<CR> | i', {  silent = true })
map('n', '<C-CR>', ':split | terminal<CR> | i', {  silent = true })

map('n', 'W', ':w |e<Left><Left>')
map('n', '<leader>q', ':q<CR>')
map('n', '<leader>Q', ':quitall<CR>')

map('n', '<leader>m', ':marks<CR>')
map('n', '<leader>b', ':buffers<CR>')

map('n', '<leader>;', ':!') -- run shell commands

map('n', 'c', '"_c') -- Don't copy to clipboard with `c*`

-- completion
map('i', '<C-f>', '<C-x><C-f>') -- start pathname suggestion
vim.cmd [[ inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>" ]]

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
map('n', '<leader>O', ':tabnew<CR>')
map('n', '<leader>j', ':tabnext<CR>')
map('n', '<leader>k', ':tabprev<CR>')


-- buffer
map('n', '<leader>n' ,':bn<CR>')
map('n', '<leader>p' ,':bp<CR>')

map('n', '<leader>df', ':diffthis<CR>')

-- toggle editor visuals
map('n', '<leader>ts', ':set spell!<CR>')
map('n', '<leader>tw', ':set wrap!<CR>')
map('n', '<leader>tc', ':set cursorcolumn!<CR>')
map('n', '<leader>th', ':set hlsearch!<CR>')
map('n', '<leader>tn', ':set relativenumber!<CR>')

map('n', '<leader>f', ':FZF<CR>')


-- plugins
-- nvim-colorizer
map('n', '<leader>tC', ':ColorizerToggle<CR>')
map('n', '<leader>rC', ':ColorizerReloadAllBuffers<CR>')
-- nvim-treesitter
map('n', '<leader>tH', ':TSToggle highlight<CR>')
-- indent-blankline
map('n', '<leader>tI', ':IBLToggle<CR>')
-- render-markdown
map('n', '<leader>tM', ':RenderMarkdown toggle<CR>')
map('n', '<leader>M', ':RenderMarkdown preview<CR>')
-- vim-fugitive
map('n', '<leader>gg', ':G<CR>')
map('n', '<leader>gds', ':Gdiffsplit<CR>')
map('n', '<leader>gdv', ':Gvdiffsplit<CR>')
map('n', '<leader>gl', ':Git log --graph --pretty=format:\'%Cred%h%Creset%C(yellow)%d%Creset %s%Cgreen(%cr)\'<CR><CR>')
-- lf
map('n', '<leader>o', ':LfNewTab<CR>')
