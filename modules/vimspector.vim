let g:vimspector_enable_mappings='HUMAN'

nmap <leader>d6 :call vimspector#Continue()
nmap <leader>d7 :call vimspector#StepInto()
nmap <leader>d8 :call vimspector#StepOver()
nmap <leader>d9 :call vimspector#StepOut()
nmap <leader>d0 :call vimspector#Stop()

nmap <leader>de :VimspectorEval
nmap <leader>dw :VimspectorWatch
nmap <leader>dx :VimspectorReset<CR>
no <leader>db :call vimspector#ToggleBreakpoint()
no <leader>dl :call vimspector#ListBreakpoints()

nmap <leader>dd :call vimspector#Launch()<CR>
