-- vim:ft=lua
-- nvim/lua/config/autocmd.lua
-- @author nate zhou
-- @since 2025

-- Disable auto comment on new line
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

vim.api.nvim_create_augroup('scripts', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
    group = 'scripts',
    pattern = '*',
    callback = function()
        if vim.fn.getline(1):match('^#!/.+') then
            vim.cmd('silent !chmod +x ' .. vim.fn.shellescape(vim.fn.expand('%')))
        end
    end,
})

vim.api.nvim_create_augroup('gitcommit', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
    group = 'gitcommit',
    pattern = 'gitcommit',
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = 'en_us'
        vim.opt_local.cc = '72'
    end,
})

vim.api.nvim_create_augroup('neomutt', { clear = true })
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    group = 'neomutt',
    pattern = '/tmp/neomutt-*',
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = 'en_us'
        vim.opt_local.cc = '80'
    end,
})

vim.api.nvim_create_augroup('qutebrowser', { clear = true })
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    group = 'qutebrowser',
    pattern = '/tmp/qutebrowser-editor-*',
    callback = function()
        vim.opt_local.filetype = 'markdown'
    end,
})

-- Aboid 24-bit colors inside dvtm.
-- However vim is still the preffered editor inside dvtm as neovim has very
-- slow load/exit speed even with `--clean`
vim.api.nvim_create_augroup('dvtm', { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
    group = 'dvtm',
    callback = function()
        if os.getenv("DVTM") ~= nil and os.getenv("DVTM") ~= "" then
            vim.opt_local.termguicolors = false
        end
    end,
})
