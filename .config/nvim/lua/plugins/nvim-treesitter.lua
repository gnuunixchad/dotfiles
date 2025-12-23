-- vim:ft=lua
-- nvim/lua/plugins/nvim-treesitter.lua
-- @author nate zhou
-- @since 2025
-- This config only works on nvim-treesitter master branch since December 2025.

require'nvim-treesitter.configs'.setup {
    ensure_installed = { "bash", "diff", "markdown", "markdown_inline", "c", "java", "python", "go", "gotmpl", "vim", "css", "json", "make", "ssh_config", "html"},

    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
  },
}
