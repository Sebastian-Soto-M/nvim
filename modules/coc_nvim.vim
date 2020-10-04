let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-explorer',
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-snippets',
            \ 'coc-yank',
            \ ]

nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

