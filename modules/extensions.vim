            " \ 'coc-angular',
let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-bookmark',
            \ 'coc-css',
            \ 'coc-emmet',
            \ 'coc-explorer',
            \ 'coc-git',
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

    " refactor
    nmap <leader>qf  <Plug>(coc-fix-current)
    nmap <leader>rr <Plug>(coc-rename)

    " search
    nmap <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
    nmap <space>s  :CocSearch 
    nn <silent> <space>b :CocList bookmark<CR>
aug end

aug plugins | au!
    au FileType,BufEnter * call s:actions()
    au FileType,BufEnter * call s:coc_fzf()
    au FileType,BufEnter * call s:explorer()
    au FileType,BufEnter * call s:git()
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

func! s:git()
    nmap <leader>gj :diffget //3<CR>
    nmap <leader>gf :diffget //2<CR>
    nmap <leader>gs :G<CR>
    nmap <leader>gp :Gpush<CR>
    nmap <leader>gf :Gfetch<CR>
    nmap <leader>gl :Gpull<CR>
endf

func! s:coc_fzf()
    nn <silent> <space>t :<C-u>CocFzfList snippets<CR>
    nn <silent> <space>y :<C-u>CocFzfList yank<CR>
    no <silent> <space>c :<C-u>CocFzfList commands<CR>
    no <silent> <space>e :<C-u>CocFzfList extensions<CR>
    no <silent> <space>g :<C-u>BCommits<CR>
    no <silent> <space>o :<C-u>CocFzfList outline<CR>
    no <silent> <space>p :<C-u>CocFzfListResume<CR>
    set mouse=a
endf

" Functions for extensions
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction

