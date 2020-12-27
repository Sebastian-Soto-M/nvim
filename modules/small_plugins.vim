let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

let g:sort_motion_visual_block_command = "Vissort"
let g:sort_motion = '\s'
let g:sort_motion_lines = '\sl'
let g:sort_motion_visual = '\s'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Set a language to use its alternate delimiters by default
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
nmap ++ <plug>NERDCommenterToggle
vmap ++ <plug>NERDCommenterToggle

let g:colorizer_auto_color=1
let g:colorizer_skip_comments=1
let g:colorizer_disable_bufleave=1
let g:colorizer_auto_filetype='scss,sass,css,html'
let g:colorizer_colornames = 0

let g:user_emmet_leader_key='`'

no <silent> <leader>tc :ColorToggle<CR>

map <leader>tb :TableModeToggle<CR>

map <leader>tg :TagbarToggle<CR>

" Note: Make sure the function is defined before `vim-buffet` is loaded.
function! g:BuffetSetCustomColors()
  hi! BuffetCurrentBuffer cterm=NONE ctermbg=5 ctermfg=8 guibg=#00FF00 guifg=#000000
endfunction

let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

let g:jsx_ext_required = 0
