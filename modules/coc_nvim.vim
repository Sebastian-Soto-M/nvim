let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-explorer',
            \ 'coc-git',
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-snippets',
            \ 'coc-yank',
            \ ]

aug coc_def | au!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

    " Show yank list
    nn <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
    
    " refactor
    nmap <leader>qf  <Plug>(coc-fix-current)
    nmap <leader>rr <Plug>(coc-rename)

    " search
    nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
    nmap <space>s  :CocSearch 
aug end

aug plugins | au!
    autocmd FileType,BufEnter * call s:explorer()
    autocmd FileType,BufEnter * call s:actions()
    autocmd FileType,BufEnter * call s:git()
aug end

func! s:actions()
    xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
endf

func! s:explorer()
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

func s:git()
    nmap <leader>gh :diffget //3<CR>
    nmap <leader>gu :diffget //2<CR>
    nmap <leader>gs :G<CR>
endf

" Functions for extensions
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

