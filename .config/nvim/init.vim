" @author nate zhou
" @since 2023,2024,2025

source ${HOME}/.config/nvim/autocmd.vim
source ${HOME}/.config/nvim/bindings.vim
source ${HOME}/.config/nvim/plugins.vim

colorscheme unixchad
syntax on
set encoding=utf-8
set title           " terminal title
set background=dark
set mouse=          " disable mouse clicks
set clipboard=unnamedplus

" set nohlsearch
set ignorecase      " case insensitive searching
set smartcase       " search case insensitive; if upper exists sensitive;

set number
set relativenumber
set cc=80
set cursorline
set cursorcolumn
match ExtraWhitespace /\s\+$/ " space at the end of lines
highlight ExtraWhitespace ctermbg=gray guibg=gray " highlight all trailing spaces
set statusline+=%f\ %{FugitiveStatusline()}\ %h%m%r%=\ %-16.(%)\ %c[%l/%L\ %P]
set laststatus=2

set expandtab		" expand tab input with spaces
set tabstop=4		" spaces per tab
set shiftwidth=4	" spaces per indentation level
set smartindent		" aware indentations for newline insert
set splitbelow splitright " new split position
