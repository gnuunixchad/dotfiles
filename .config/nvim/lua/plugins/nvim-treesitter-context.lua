-- vim:ft=lua
-- nvim/lua/plugins/nvim-treesitter-context.lua
-- @author nate zhou
-- @since 2026

require'treesitter-context'.setup{
    enable = true,
    line_numbers = true,
    multiline_threshold = 5,
    trim_scope = 'outer',
    mode = 'topline',
}
