let g:NERDAltDelims_java = 1
" -M (match continuation indent) -xt (indent continuation) -xC (max code length) -xU (indent after parens) -xe (delete empty lines) -xg (pad comma)
let g:formatdef_cstm_java='"astyle --mode=java --style=java -M120 -xC80 -xt4 -xe -xg"' 
let g:formatters_java=['cstm_java']

no <leader>dd :CocCommand java.debug.vimspector.start<CR>

ino <buffer> {<CR> {<CR>}<C-o>O

au BufWrite *.java :Autoformat

setlocal shiftwidth=4 tabstop=4
