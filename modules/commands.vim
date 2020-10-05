func ConfigAdd()
    !/usr/bin/git --git-dir=$HOME/.config/dotfiles/ --work-tree=$HOME add '%:p'
endfunc

augroup configs | au!
    au BufWritePost config.h !sudo make clean install
    au BufWritePost $XDG_CONFIG_HOME/X11/xresources/*,.Xresources :silent call ConfigAdd() | :!xrdb /home/snsm/.Xresources
    au BufWritePost $XDG_CONFIG_HOME/nvim/coc-settings.json,$XDG_CONFIG_HOME/nvim/modules/*,$XDG_CONFIG_HOME/scripts/* :silent call ConfigAdd()
    au BufWritePost .zshenv,$XDG_CONFIG_HOME/picom/picom.conf,$XDG_CONFIG_HOME/sxhkd/sxhkdrc,$XDG_CONFIG_HOME/tmux/tmux.conf,$XDG_CONFIG_HOME/zsh/*.zsh* :silent call ConfigAdd()
augroup END
