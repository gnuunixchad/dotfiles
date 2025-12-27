-- vim:ft=lua
-- nvim/lua/plugins/nvim-treesitter.lua
-- @author nate zhou
-- @since 2025
-- This config only works on nvim-treesitter master branch since December 2025.

require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'bash', 'diff', 'markdown', 'markdown_inline', 'c', 'java', 'python', 'go', 'gotmpl', 'vim', 'css', 'json', 'make', 'ssh_config', 'html'},

    highlight = {
        enable = true,
        disable = { 'sh', 'bash' },
        additional_vim_regex_highlighting = false,
  },
}

-- another way is to set `highlight.enable` to false and whitelist filetypes
--vim.api.nvim_create_autocmd('FileType', {
--    pattern = { 'markdown', 'markdown_inline', 'java' }
--    callback = function()
--        vim.treesitter.start()
--    end,
--})
