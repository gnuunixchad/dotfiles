" nvim/autocmd.vim
" @author nate zhou
" @since 2023, 2024, 2025

" Disable auto comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup gitcommit
    autocmd!
    autocmd FileType gitcommit setlocal spell spelllang=en_us
    autocmd FileType gitcommit setlocal cc=72
augroup END

augroup neomutt
    autocmd!
    autocmd BufRead,BufNewFile /tmp/neomutt-* setlocal spell spelllang=en_us
    autocmd BufRead,BufNewFile /tmp/neomutt-* setlocal cc=80
augroup END

augroup qutebrowser
    autocmd BufRead,BufNewFile /tmp/qutebrowser-* setlocl filetype=markdown
augroup END

augroup dvtmeditor
    autocmd BufRead,BufNewFile /tmp/dvtm-editor.* setlocal norelativenumber
    autocmd BufRead,BufNewFile /tmp/dvtm-editor.* setlocal nocursorline
    autocmd BufRead,BufNewFile /tmp/dvtm-editor.* setlocal nocursorcolumn
    autocmd BufRead,BufNewFile /tmp/dvtm-editor.* setlocal cc=0
    autocmd BufRead,BufNewFile /tmp/dvtm-editor.* setlocal notermguicolors
    autocmd BufRead,BufNewFile /tmp/dvtm-editor.* setlocal laststatus=0
    autocmd BufRead,BufNewFile /tmp/dvtm-editor.* syntax off
augroup END
