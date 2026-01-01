" vim/bindings.vim
" @author nate zhou
" @since 2023,2024,2025

let mapleader=" "   " set space as leader key

" escape terminal mode with vi mode shell
tnoremap <leader><ESC> <C-\><C-n>
tnoremap <leader>q <C-\><C-n>:quit!<CR>
tnoremap <C-q> <C-\><C-n>:quit!<CR>

nnoremap <leader><CR> :terminal<CR>
nnoremap <C-CR> :terminal<CR>

nnoremap W :w \|e<Left><Left>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :quitall<CR>

nnoremap <leader>m :marks<CR>
nnoremap <leader>b :buffers<CR>

nnoremap <leader>; :!

" don't yank to clipboard with c
nnoremap c "_c

" completion
inoremap <C-f> <C-x><C-f>
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

" split
nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>
" movement
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
" position
nnoremap <C-w>h :wincmd H<CR>
nnoremap <C-w>j :wincmd J<CR>
nnoremap <C-w>k :wincmd K<CR>
nnoremap <C-w>l :wincmd L<CR>
" resize
nnoremap <C-w>y :vertical resize -2<CR>
nnoremap <C-w>u :resize +2<CR>
nnoremap <C-w>i :resize -2<CR>
nnoremap <C-w>o :vertical resize +2<CR>

" tab
nnoremap <leader>O :tabnew<CR>
nnoremap <leader>j :tabprev<CR>
nnoremap <leader>k :tabnext<CR>

" buffer
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>

nnoremap <leader>df :diffthis<CR>

" toggle editor visuals
nnoremap <leader>ts :set spell!<CR>
nnoremap <leader>tw :set wrap!<CR>
nnoremap <leader>tc :set cursorcolumn!<CR>
nnoremap <leader>th :set hlsearch!<CR>
nnoremap <leader>tn :set relativenumber!<CR>

nnoremap <leader>f :FZF<CR>
