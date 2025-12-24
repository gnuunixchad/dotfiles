-- vim:ft=lua
-- nvim/lua/plugins/init.lua
-- @author nate zhou
-- @since 2025

-- enables the experimental lua module loader, see `:h loader`
vim.loader.enable()

local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('norcalli/nvim-colorizer.lua')

Plug('nvim-treesitter/nvim-treesitter', { ['branch'] = 'master' })

Plug('neoclide/coc.nvim', { ['branch'] = 'release' })

Plug('lukas-reineke/indent-blankline.nvim')

Plug('MeanderingProgrammer/render-markdown.nvim')

Plug('tpope/vim-fugitive')

Plug('voldikss/vim-floaterm')
Plug('ptzz/lf.vim')

vim.call('plug#end')

require('plugins.nvim-colorizer')
require('plugins.nvim-treesitter')
require('plugins.indent-blankline')
require('plugins.render-markdown')
require('plugins.vim-floaterm')
require('plugins.lf')
