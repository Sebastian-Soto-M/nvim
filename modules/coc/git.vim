func! s:git()
    nmap <space>vj :diffget //3<CR>              " Gets the right panel
    nmap <space>vf :diffget //2<CR>              " Gets the left panel
    nmap <space>vs :G<CR>                        " Open version control
    nmap <space>vu :CocCommand git.chunkUndo<CR> " Undo chunk
    nmap <space>vi :CocCommand git.chunkInfo<CR> " get chuck info
    nmap <space>vp <Plug>(coc-git-prevchunk)   " Get to the prev chuck and center
    nmap <space>vn <Plug>(coc-git-nextchunk)   " Get to the prev chuck and center
endf

func! s:git_fzf()
    nmap <space>va    :<C-u>CocCommand fzf-preview.GitActions<CR>
    nmap <space>vl    :<C-u>CocCommand fzf-preview.GitLogs<CR>
    nmap <space>vb    :<C-u>CocCommand fzf-preview.GitBranches<CR>
endf

aug git | au!
    call s:git()
    call s:git_fzf()
aug end

