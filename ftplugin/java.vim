let g:NERDAltDelims_java = 1
let g:formatdef_cstm_java='"astyle --mode=java --style=java"'
let g:formatters_java=['cstm_java']

no <leader>dd :CocCommand java.debug.vimspector.start<CR>

ino <buffer> {<CR> {<CR>}<C-o>O
