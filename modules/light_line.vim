au User CocStatusChange,CocDiagnosticChange call lightline#update()

let g:lightline = {
            \ 'colorscheme': 'gruvbox',
            \ 'active': {
            \   'left': [ [ 'mode', 'paste', 'coc_errors', 'coc_warnings', 'coc_ok' ],[ 'gitbranch' ],
            \             [ 'cocstatus', 'readonly', 'filename', 'modified', 'blame' ] ]
            \ },
            \ 'component_function': {
            \   'blame': 'lightlinegitblame',
            \   'cocstatus': 'coc#status'
            \ },
            \ 'component_type': {
            \   'gitbranch': 'tabsel',
            \ },
            \ 'component_expand': {
            \   'gitbranch': 'LightlineGitbranch',
            \ },
            \ 'separator': {'left': '', 'right': ''},
            \ }

call lightline#coc#register()

let g:gitbranch_icon = ''

function! LightlineGitbranch()
	let l:bname = gitbranch#name()
	return l:bname != '' ? g:gitbranch_icon . ' ' . l:bname : ''
endfunction

function! LightlineGitBlame() abort
    let blame = get(g:, 'coc_git_status', '')
    " return blame
    return winwidth(0) > 120 ? blame : ''
endfunction
