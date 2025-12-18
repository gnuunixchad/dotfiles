-- vim:ft=lua
-- nvim/lua/plugins/init.lua
-- @author nate zhou
-- @since 2025

vim.cmd [[
call plug#begin()
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'
Plug 'tpope/vim-fugitive'
Plug 'voldikss/vim-floaterm'
Plug 'ptzz/lf.vim'
call plug#end()
]]

require('plugins.nvim-colorizer')
require('plugins.nvim-treesitter')
require('plugins.indent-blankline')
require('plugins.render-markdown')
require('plugins.vim-floaterm')
require('plugins.lf')
