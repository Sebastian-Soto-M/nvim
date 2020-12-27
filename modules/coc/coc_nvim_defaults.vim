set hidden
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes " default was auto

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

fu! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endf

let g:coc_snippet_next = '<tab>'

ino <silent><expr> <a-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm. 
if exists('*complete_info')
  ino <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  ino <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" refactor
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>rr <Plug>(coc-rename)

" search
no <leader>prw :CocSearch <C-R>=expand("<cword>")<CR><CR>
no <space>s  :CocSearch 

" Use K to show documentation in preview window.
nn <silent> K :call <SID>show_documentation()<CR>

fu! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endf

" Highlight the symbol and its references when holding the cursor.
au CursorHold * silent call CocActionAsync('highlight')

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
no <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
com! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
com! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
com! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
"
" Show all diagnostics.
nn <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nn <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nn <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nn <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Resume latest coc list.
nn <silent><nowait> <space>p  :<C-u>CocListResume<CR>
