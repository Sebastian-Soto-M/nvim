let g:vimspector_enable_mappings='HUMAN'

let g:vimspector_sign_priority = {
            \ 'vimspectorBP': 100
            \ }

no <leader>d6 :call vimspector#Continue()<CR>
no <leader>d7 :call vimspector#StepInto()<CR>
no <leader>d8 :call vimspector#StepOver()<CR>
no <leader>d9 :call vimspector#StepOut()<CR>
no <leader>d0 :call vimspector#Stop()<CR>

no <leader>de :VimspectorEval
no <leader>dw :VimspectorWatch
no <leader>dx :VimspectorReset<CR>
no <leader>db :call vimspector#ToggleBreakpoint()<CR>
no <leader>dl :call vimspector#ListBreakpoints()<CR>

no <leader>dd :call vimspector#Launch()<CR>
