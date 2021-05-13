no <silent> <leader>tg :Toc<CR>
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_auto_insert_bullets = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_folding_disabled = 0

au FileType markdown setlocal spell spelllang=en_us,es
ino  <Esc>[s1z=`]a
setlocal shiftwidth=2 tabstop=2
