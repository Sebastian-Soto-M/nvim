func! s:plain_fzf()
    fun! FzfSpellSink(word)
        exe 'normal! "_ciw'.a:word
    endf
    fun! FzfSpell()
        let suggestions = spellsuggest(expand("<cword>"))
        return fzf#run({'window': { 'width': 0.35, 'height': 0.9, 'xoffset': 1 },
                    \ 'source': suggestions,
                    \ 'sink': function("FzfSpellSink"),
                    \ 'down': 10})
    endf

    tno <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
    imap <c-x><c-f> <plug>(fzf-complete-path)
    imap <c-x><c-l> <plug>(fzf-complete-line)
    ino <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
    nmap <leader><tab> <plug>(fzf-maps-n)
    omap <leader><tab> <plug>(fzf-maps-o)
    xmap <leader><tab> <plug>(fzf-maps-x)

    nn <leader>/ :Lines<CR>
    nn <silent> <C-p> :BTags<CR>
    nn <silent> <leader>o :Files<CR>
    tno<expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

    au FileType css,javascript,python,sass,scss,typescript nn <silent> z= :call FzfSpell()<CR>

    ino <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
                \ 'prefix': '^.*$',
                \ 'source': 'rg -n ^ --color always',
                \ 'options': '--ansi --delimiter : --nth 3..',
                \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }
                \ }))

    " Popup
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
endf
func! s:coc_fzf()
    nn <silent> <space>t :<C-u>CocFzfList snippets<CR>
    nn <silent> <space>y :<C-u>CocFzfList yank<CR>
    no <silent> <space>c :<C-u>CocFzfList commands<CR>
    no <silent> <space>e :<C-u>CocFzfList extensions<CR>
    no <silent> <space>g :<C-u>BCommits<CR>
    no <silent> <space>o :<C-u>CocFzfList outline<CR>
    no <silent> <space>d :<C-u>CocFzfList diagnostics --current-buf<CR>
    no <silent> <space>p :<C-u>CocFzfListResume<CR>
    set mouse=a
    let g:coc_fzf_opts = ['--layout=reverse']
endf

func! s:coc_fzf_preview()
    let g:fzf_preview_command = 'bat --color=always --plain {-1}'

    let g:fzf_preview_default_fzf_options = {
                \ '--reverse': v:true, '--preview-window': 'wrap',
                \ '--color': 'pointer:5,marker:13,info:3,prompt:2,fg+:15,fg:7,hl:2,hl+:4'
                \ }
                " \ '--color': 'border:10,pointer:1,marker:9,info:3,prompt:2'
                " GRUVBOX
    let g:fzf_preview_fzf_preview_window_option = 'sharp'

    let $FZF_PREVIEW_PREVIEW_BAT_THEME = 'Dracula'

    nmap <leader>o [fzf-p]
    xn <leader>o [fzf-p]

    " Git
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

aug fzf_preview | au!
    autocmd User fzf_preview#initialized call s:fzf_preview_settings()
aug end

function! s:fzf_preview_settings() abort
    let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
    let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction

aug coc_def | au!
    call s:plain_fzf()
    call s:coc_fzf()
    call s:coc_fzf_preview()
aug end

