-- vim:ft=lua
-- nvim/lua/plugins/nvim-treesitter.lua
-- @author nate zhou
-- @since 2025
-- config for nvim-treesitter main branch
-- @depends: tree-sitter-cli (in arch repo)

local languages = { 'markdown',
                    'markdown_inline',
                    'diff',
                    'make',
                    'bash',
                    'c',
                    'python',
                    'java',
                    'go',
                    'gotmpl',
                    'zig',
                    'html',
                    'css',
                    'json',
                    'yaml',
                    'vim',
                    'lua',
}

require'nvim-treesitter'.install(languages)

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'markdown', 'markdown_inline' },
  callback = function() vim.treesitter.start() end,
})
