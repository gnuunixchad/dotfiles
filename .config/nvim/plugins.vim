" nvim/plugins.vim
" @author nate zhou
" @since 2023,2024,2025

" vim-plug
call plug#begin()
Plug 'norcalli/nvim-colorizer.lua'
Plug 'tpope/vim-fugitive'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ptzz/lf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'
call plug#end()
let g:floaterm_width=0.95
let g:floaterm_height=0.95

" nvim-colorizer
set termguicolors

lua << EOF
require'colorizer'.setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "diff", "markdown", "markdown_inline", "c", "java", "python", "go", "gotmpl", "vim", "css", "json", "make", "ssh_config", "html"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

-- folding with treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.fillchars:append("fold: ")
vim.opt.foldlevelstart = 99 -- open all folds by default

-- initialize indent-blankline
require("ibl").setup()

-- render-markdown.nvim
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
EOF
