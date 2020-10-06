let g:vimspector_enable_mappings='HUMAN'

let g:vimspector_sign_priority = {
            \ 'vimspectorBP': 100
            \ }

nmap <leader>d6 :call vimspector#Continue()<CR>
nmap <leader>d7 :call vimspector#StepInto()<CR>
nmap <leader>d8 :call vimspector#StepOver()<CR>
nmap <leader>d9 :call vimspector#StepOut()<CR>
nmap <leader>d0 :call vimspector#Stop()<CR>

nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>dx :VimspectorReset<CR>
no <leader>db :call vimspector#ToggleBreakpoint()<CR>
no <leader>dl :call vimspector#ListBreakpoints()<CR>

nmap <leader>dd :call vimspector#Launch()<CR>
