func ConfigAdd()
    !/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME add '%:p'
endfunc

augroup configs | au!
    au BufWritePost config.h !sudo make clean install
    au BufWritePost $XDG_CONFIG_HOME/X11/xresources/*,.Xresources :silent call ConfigAdd() | :!xrdb /home/snsm/.Xresources
    au BufWritePost $XDG_CONFIG_HOME/nvim/coc-settings.json,$XDG_CONFIG_HOME/nvim/modules/*,$XDG_CONFIG_HOME/scripts/* :silent call ConfigAdd()
    au BufWritePost .zshenv,$XDG_CONFIG_HOME/picom/picom.conf,$XDG_CONFIG_HOME/sxhkd/sxhkdrc,$XDG_CONFIG_HOME/tmux/tmux.conf,$XDG_CONFIG_HOME/zsh/*.zsh* :silent call ConfigAdd()
augroup END

aug filetype_mappings | au!
    autocmd FileType,BufEnter * call s:mshell()
    autocmd FileType,BufEnter * call s:mpython()
    autocmd FileType,BufEnter * call s:mjava()
aug end

func! s:mpython()
    au FileType python no <Leader>r :CocCommand python.execInTerminal<CR>
endf

func! s:mshell()
    au FileType sh,bash,zsh vn <buffer> <silent> <leader>f :Tabularize /)\\|;;<CR>
endf

func! s:mjava()
    let g:formatdef_cstm_java='"astyle --mode=java --style=java"'
    let g:formatters_java=['cstm_java']
endf
