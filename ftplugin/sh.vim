setlocal shiftwidth=4 tabstop=4
au BufWrite * :Autoformat
no <buffer> <silent> <leader>f :Tabularize /)\\|;;<CR>

