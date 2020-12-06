let g:coc_global_extensions = [
            \ 'coc-actions',
            \ 'coc-angular',
            \ 'coc-bookmark',
            \ 'coc-css',
            \ 'coc-cssmodules',
            \ 'coc-emmet',
            \ 'coc-explorer',
            \ 'coc-fzf-preview',
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
    no <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
    no <space>s  :CocSearch 
    nn <silent> <space>b :CocList bookmark<CR>
aug end

aug plugins | au!
    au FileType,BufEnter * call s:actions()
    " au FileType,BufEnter * call s:coc_fzf()
    au FileType,BufEnter * call s:coc_fzf_preview()
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

func! s:git()
    nmap <space>v [git-cmd]
    xmap <space>v [git-cmd]

    no [git-cmd]j :diffget //3<CR>              " Gets the right panel
    no [git-cmd]f :diffget //2<CR>              " Gets the left panel
    no [git-cmd]s :G<CR>                        " Open version control
    no [git-cmd]u :CocCommand git.chunkUndo<CR> " Undo chunk
    no [git-cmd]i :CocCommand git.chunkInfo<CR> " get chuck info
    nmap [git-cmd]p <Plug>(coc-git-prevchunk)   " Get to the prev chuck and center
    nmap [git-cmd]n <Plug>(coc-git-nextchunk)   " Get to the prev chuck and center
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

func! s:coc_fzf_preview()
    let g:fzf_preview_command = 'bat --color=always --plain {-1}'

    let g:fzf_preview_default_fzf_options = {
                \ '--reverse': v:true, '--preview-window': 'wrap',
                \ '--color': 'border:10,pointer:1,marker:9,info:3,prompt:2'
                \ }
    let g:fzf_preview_fzf_preview_window_option = 'sharp'

    let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'gruvbox'

    nmap <Leader>o [fzf-p]
    xmap <Leader>o [fzf-p]

    " Git
    no [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
    no [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
    no [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>

    " Buffers
    no [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
    no [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
    no [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
    no [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>

    " Files
    no [fzf-p]f     :<C-u>CocCommand fzf-preview.ProjectMrwFiles<CR>
    no [fzf-p]F     :<C-u>CocCommand fzf-preview.ProjectMruFiles<CR>

    " Lines
    no [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
    no [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
    no [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
    no [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>

    " Tools
    no [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
    xn [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
    no <silent> <C-c> :<C-u>CocCommand fzf-preview.CommandPalette<CR>
endf

" Functions for extensions
function! s:cocActionsOpenFromSelected(type) abort
    execute 'CocCommand actions.open ' . a:type
endfunction

augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#initialized call s:fzf_preview_settings()
augroup END

function! s:fzf_preview_settings() abort
  let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
  let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction
