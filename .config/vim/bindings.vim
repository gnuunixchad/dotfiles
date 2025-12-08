" vim/bindings.vim
" @author nate zhou
" @since 2023,2024,2025

let mapleader=" "   " set space as leader key

nnoremap <leader>e :exe '1wincmd w \| wincmd '.(winwidth(0) == &columns ? 'H' : 'K')<CR>

" split open (<leader>q quit a split)
map <leader>x :split<CR>
map <leader>v :vsplit<CR>
" split movement with ctrl+h/j/k/l
map <C-h> :wincmd h<CR>
map <C-j> :wincmd j<CR>
map <C-k> :wincmd k<CR>
map <C-l> :wincmd l<CR>
" split resize with ctrl+y/u/i/o
map <C-w>y :vertical resize -2<CR>
map <C-w>u :resize +2<CR>
map <C-w>i :resize -2<CR>
map <C-w>o :vertical resize +2<CR>
" swap split position with ctrl-w + H/J/K/L
map <C-w>h :wincmd H<CR>
map <C-w>j :wincmd J<CR>
map <C-w>k :wincmd K<CR>
map <C-w>l :wincmd L<CR>

nmap <c-q> :q<CR>
" save current buffer (as filename when necessary) and reload
nmap W :w \|e<Left><Left>
nmap <leader>1 :!
" move focus to next split instead of resizing
nnoremap <Tab> <C-W>w
" terminal mode to normal mode
tnoremap <leader><Esc> <C-\><C-n>

map <leader>s :set spell!<CR>
map <leader>w :set wrap!<CR>
map <leader>C :set cursorcolumn!<CR>
map <leader>h :set hlsearch!<CR>
map <leader>t :tabnew<CR>
map <leader>p :tabprev<CR>
map <leader>n :tabnext<CR>

map <leader>f :FZF<CR>

map <leader>g :G<CR>
map <leader>dx :Gdiffsplit<CR>
map <leader>dv :Gvdiffsplit<CR>
map <leader><Tab> :NERDTreeToggle<CR>
map <leader>ct :ColorizerToggle<CR>
map <leader>cr :ColorizerReloadAllBuffers<CR>
