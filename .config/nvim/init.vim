" @author nate zhou
" @since 2023, 2024

colorscheme vim

syntax on
" set spell
set ignorecase      " case insensitive searching
set smartcase       " lower case search case insensitive; if upper case exists, case sensitive; "used with set ignorecase

set background=dark
set nohlsearch
set cc=80
set expandtab		" expand tab input with spaces
set tabstop=4		" spaces per tab
set shiftwidth=4	" spaces per indentation level
set smartindent		" aware indentations for newline insert
set number
set relativenumber
set clipboard=unnamedplus
"set cursorline
"set cursorcolumn

match ExtraWhitespace /\s\+$/ " space at the end of lines
highlight ExtraWhitespace ctermbg=gray guibg=gray " highlight all trailing spaces

" %F full file path | %f relative path to working directory | %m modified flag | %r read-only flag
"set statusline+=%f\ %h%m%r\ %{FugitiveStatusline()}%=\ %y\ [%{&fileformat}]\ [%{&encoding}]\ \ %-8.(%l,%c%)\ %P
" set statusline+=%f\ %h%m%r%=\ %{FugitiveStatusline()}\ %y\ [%{&encoding}]\ \ %-8.(%l,%c%)\ %P

let mapleader=" " " set space as leader key

""""""""""""""""""""""custom keybindings"""""""""""""""""""""""""""""""""""""""
" toggle spell check, this line must be under the leader key defination line
" <CR> means carriage return
map <leader>s :set spell!<CR>

" toggle cursorcolumn
map <leader>c :set cursorcolumn!<CR>

" split movement with ctrl+h/j/k/l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" split resize with ctrl+y/u/i/o
map <C-y> <C-w><
map <C-u> <C-w>-
map <C-i> <C-w>=
map <C-o> <C-w>>

" split open
map <leader>x :split<CR>
map <leader>v :vsplit<CR>

" automatically deletes trailing whitespace on save, .md need double spaces as line breaks
" autocmd BufWritePre * %s/\s\+$//e

" automatically run xrdb when Xresources are updated
" autocmd BufWritePost ~/.Xresources !xrdb %

""""""""""""""""""""""plugins"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug plugins
call plug#begin()
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive' " git
Plug 'ap/vim-css-color'
call plug#end()

" nerdtree keybindings
nnoremap <leader>n :NERDTreeToggle<CR>
