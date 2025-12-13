-- vim:ft=lua
-- nvim/lua/config/autocmd.lua @author nate zhou
-- @since 2025

-- Disable auto comment on new line
vim.api.nvim_create_autocmd('BufEnter', {
    callback = function()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

-- gitcommit
vim.api.nvim_create_autocmd('Filetype', {
    pattern = 'gitcommit',
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = 'en_us'
        vim.opt_local.cc = '72'
    end,
})

-- neomutt
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = '/tmp/neomutt-*',
    callback = function()
        vim.opt_local.spell = true
        vim.opt_local.spelllang = 'en_us'
        vim.opt_local.cc = '80'
    end,
})

-- qutebrowser
vim.api.nvim_create_autocmd({'BufRead', 'BufNewFile'}, {
    pattern = '/tmp/qutebrowser-editor-*',
    callback = function()
        vim.opt_local.filetype = 'markdown'
    end,
})

-- dvtm
-- Aboid 24-bit colors inside dvtm.
-- However vim is still the preffered editor inside dvtm as neovim has very
-- slow load/exit speed even with `--clean`
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        if os.getenv("DVTM") ~= nil and os.getenv("DVTM") ~= "" then
            vim.opt_local.termguicolors = false
        end
    end,
})
