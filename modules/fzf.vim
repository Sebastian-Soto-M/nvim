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

" fzf
function! FzfSpellSink(word)
    exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
    let suggestions = spellsuggest(expand("<cword>"))
    return fzf#run({'window': { 'width': 0.35, 'height': 0.9, 'xoffset': 1 },
                \ 'source': suggestions,
                \ 'sink': function("FzfSpellSink"),
                \ 'down': 10})
endfunction

au FileType css,javascript,python,sass,scss,typescript setlocal spell  spelllang=en_us
au FileType css,javascript,python,sass,scss,typescript nn <silent> z= :call FzfSpell()<CR>

inoremap <expr> <c-x><c-l> fzf#vim#complete(fzf#wrap({
            \ 'prefix': '^.*$',
            \ 'source': 'rg -n ^ --color always',
            \ 'options': '--ansi --delimiter : --nth 3..',
            \ 'reducer': { lines -> join(split(lines[0], ':\zs')[2:], '') }
            \ }))

" Popup
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
