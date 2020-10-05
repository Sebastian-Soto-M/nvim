tno <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)
ino <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
nmap <leader><tab> <plug>(fzf-maps-n)
nn <silent> z= :call FzfSpell()<CR>
omap <leader><tab> <plug>(fzf-maps-o)
xmap <leader><tab> <plug>(fzf-maps-x)

nn <leader>/ :Lines<CR>
nn <silent> <C-p> :BTags<CR>
nn <silent> <leader>o :Files<CR>
tno<expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"

" fzf
function! FzfSpellSink(word)
    exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
    let suggestions = spellsuggest(expand("<cword>"))
    "return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
    return fzf#run({'window': { 'width': 0.35, 'height': 0.9, 'xoffset': 1 },
                \ 'source': suggestions,
                \ 'sink': function("FzfSpellSink"),
                \ 'down': 10})
endfunction

function! s:fzf_statusline()
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction
au! User FzfStatusLine call <SID>fzf_statusline()

inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
            \ 'prefix': '^.*$',
            \ 'source': 'rg -n ^ --color always',
            \ 'options': '--ansi --delimiter : --nth 3..',
            \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }
            \ }))

" Popup
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Colors
let g:fzf_colors =
    \ { 'bg':      ['bg', 'Normal'],
    \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
    \ 'border':  ['fg', 'Ignore'],
    \ 'fg':      ['fg', 'Normal'],
    \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
    \ 'header':  ['fg', 'Comment'],
    \ 'hl':      ['fg', 'Comment'],
    \ 'hl+':     ['fg', 'Statement'],
    \ 'info':    ['fg', 'PreProc'],
    \ 'marker':  ['fg', 'Keyword'],
    \ 'pointer': ['fg', 'Exception'],
    \ 'prompt':  ['fg', 'Conditional'],
    \ 'spinner': ['fg', 'Label']}
