" nvim/autocmd.vim
" @author nate zhou
" @since 2025

" don't comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup git
    autocmd!
    " Enable spell check for Git commit
    autocmd FileType gitcommit setlocal spell spelllang=en_us
    " Set column count to 72 for Git commit
    autocmd FileType gitcommit setlocal cc=72
augroup END

augroup mutt
    autocmd!
    " spell check
    autocmd BufRead,BufNewFile /tmp/neomutt-* setlocal spell spelllang=en_us
    " column width
    autocmd BufRead,BufNewFile /tmp/neomutt-* setlocal cc=80
augroup END
