let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
let g:qs_max_chars=80

let g:sort_motion_visual_block_command = "Vissort"
let g:sort_motion = 's'
let g:sort_motion_lines = 'sl'
let g:sort_motion_visual = 's'

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
nmap ++ <plug>NERDCommenterToggle
vmap ++ <plug>NERDCommenterToggle
