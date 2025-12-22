-- vim:ft=lua
-- nvim/init.lua
-- @author nate zhou
-- @since 2025

require('config.options')
require('config.autocmd')
require('config.bindings')
require('plugins.init')

-- require('config.colors')
vim.cmd('colorscheme vim')
