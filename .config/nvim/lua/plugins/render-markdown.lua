-- vim:ft=lua
-- nvim/lua/plugins/render-markdown.lua
-- @author nate zhou
-- @since 2025

require('render-markdown').setup({
    enabled = true,
    render_modes = true,
    heading = {
            backgrounds = false,
            sign = false,
            icons = {'# ', '## ', '### ', '#### ', '##### ', '###### '},
    },
    code = { enabled = false, },
    indent = { enabled = false, },
    pipe_table = { style = 'normal' },
})
