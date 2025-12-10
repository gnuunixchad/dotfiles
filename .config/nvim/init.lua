-- vim:ft=lua
-- nvim/init.lua
-- @author nate zhou
-- @since 2025

require('config.colors')
require('config.options')
require('config.autocmd')
require('config.bindings')


vim.cmd [[
call plug#begin()
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'
call plug#end()
]]

require('plugins.nvim-colorizer')
require('plugins.nvim-treesitter')
require('plugins.indent-blankline')
require('plugins.render-markdown')
