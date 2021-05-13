setlocal shiftwidth=2 tabstop=2
ino <buffer> {<CR> {<CR>}<C-o>O
no <silent> <Leader>r :w <bar> :!ts-node %<CR>

