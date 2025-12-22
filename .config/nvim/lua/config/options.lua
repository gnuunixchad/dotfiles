-- vim:ft=lua
-- nvim/lua/config/options.lua
-- @author nate zhou
-- @since 2025

vim.o.encoding = 'utf-8'

vim.o.mouse = '' -- Disable mouse button moving cursor

vim.o.clipboard = 'unnamedplus'

vim.o.ignorecase = true -- searching case insensitive
vim.o.smartcase = true	-- except patterns contain uppercase

-- visual
vim.o.statusline = '%f %h%m%r%= %-16.(%) %c [%l/%L %P]'
vim.o.laststatus = 2

vim.o.number = true
vim.o.relativenumber = true

vim.o.cc = '80'
vim.o.cursorline = false
vim.o.cursorcolumn = false

vim.cmd('syntax on')

vim.o.termguicolors = true
vim.o.background = 'dark'

-- highlight all trailing spaces
vim.cmd('match TrailingSpace /\\s\\+$/')
vim.cmd('highlight TrailingSpace ctermbg=gray guibg=gray')

-- indentation
vim.o.expandtab = true -- <Tab> expands spaces instead of \t
vim.o.tabstop = 4 -- spaces per <Tab>
vim.o.shiftwidth =4 --spaces per indentation level
vim.o.smartindent = true -- indentation is aware of newline insert

vim.o.splitbelow = true
vim.o.splitright = true
