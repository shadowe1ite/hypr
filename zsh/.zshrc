# Zap Plugins
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "shadowelite-sec/elite-prompt"
plug "zap-zsh/completions"
plug "hlissner/zsh-autopair"

#wal
#(/bin/cat ~/.cache/wal/sequences &)    
#source ~/.cache/wal/colors-tty.sh     

# export
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/opt/metasploit/tools/exploit
export PATH=$PATH:/usr/share/firmware-mod-kit
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# nvidia
#export __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo | grep 'OpenGL renderer string'

# alias
alias icat="kitty +kitten icat"
alias ls="ls --color=auto -1t"
alias vi="nvim"
alias vim="nvim"
#alias zathura="~/.local/bin/zathura"
alias ip="ifconfig | grep inet | head -n3  | tail -n1"
alias hs="history | cut -c 8- | sort | uniq | fzf | tr -d '\\n' | xclip -selection c"
alias grep="grep --color"
alias pacman="pacman --color auto"
#alias cat="bat"

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

#eval "$(starship init bash)"
#PS1='[\u@\h \W]\$ '

