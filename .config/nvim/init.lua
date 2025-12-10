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
call plug#end()
]]

require('plugins.nvim-colorizer')
require('plugins.nvim-treesitter')
