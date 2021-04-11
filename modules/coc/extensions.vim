let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-angular',
            \ 'coc-css',
            \ 'coc-cssmodules',
            \ 'coc-emmet',
            \ 'coc-explorer',
            \ 'coc-fzf-preview',
            \ 'coc-git',
            \ 'coc-lua',
            \ 'coc-html',
            \ 'coc-java',
            \ 'coc-java-debug',
            \ 'coc-json',
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-python',
            \ 'coc-snippets',
            \ 'coc-tsserver',
            \ 'coc-vimlsp',
            \ 'coc-xml',
            \ 'coc-yank',
            \ ]

aug coc_def | au!
    au FileType typescript,json setl formatexpr=CocAction('formatSelected')
    au BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
    " Update signature help on jump placeholder.
    au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
aug end

aug plugins | au!
    au FileType,BufEnter * call s:actions()
    au FileType,BufEnter * call s:explorer()
aug end

" Functions for extensions
fun! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endf

func! s:actions()
    xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
endf


func! s:explorer()
    nn <silent> <space><space> :CocCommand explorer<CR>
    nn <silent> <space>et :CocCommand explorer --preset tab<CR>
    nn <silent> <space>ev :CocCommand explorer --preset vim<CR>
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
