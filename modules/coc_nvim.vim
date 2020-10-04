let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-explorer',
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-snippets',
            \ 'coc-yank',
            \ ]

aug coc_def | au!
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Show yank list
  nn <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
aug end

aug plugins | au!
    autocmd FileType * call s:explorer()
aug end

function! s:explorer()
    nn <silent> <space><space> :CocCommand explorer<CR>
    nn <silent> <space>et :CocCommand explorer --preset tab<CR>
    nn <silent> <space>el :CocList explPresets<CR>
    let g:coc_explorer_global_presets = {
                \   'vim': {
                \     'root-uri': '~/.config/nvim',
                \   },
                \   'tab': {
                \     'position': 'tab',
                \     'quit-on-open': v:true,
                \   },
                \   'simplify': {
                \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
                \   }
                \ }
endf
