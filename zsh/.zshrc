# Zap Plugins
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"
plug "zap-zsh/supercharge"
plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "shadowelite-sec/elite-prompt"
plug "zap-zsh/completions"
plug "hlissner/zsh-autopair"

# manjaro
#USE_POWERLINE="true"
#if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
#  source /usr/share/zsh/manjaro-zsh-config
#fi
## Use manjaro zsh prompt
#if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
#  source /usr/share/zsh/manjaro-zsh-prompt
#fi

#wal
#(/bin/cat ~/.cache/wal/sequences &)    
#source ~/.cache/wal/colors-tty.sh     

# export
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/opt/metasploit/tools/exploit
export PATH=$PATH:/usr/share/firmware-mod-kit
#export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export TERM=xterm

# nvidia
#export __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo | grep 'OpenGL renderer string'

# alias
alias icat="kitty +kitten icat"
alias ls="ls --color=auto -1t"
alias cp="cp -iv"
alias mv="mv -iv"
alias vi="nvim"
alias vim="nvim"
#alias zathura="~/.local/bin/zathura"
alias ip="ifconfig | grep inet | head -n3  | tail -n1"
alias hs="history | cut -c 8- | sort | uniq | fzf | tr -d '\\n' | xclip -selection c"
alias grep="grep --color"
alias pacman="pacman --color auto"
#alias mpv="prime-run mpv"
#alias cat="bat"

eval $(thefuck --alias)

# Fn 
# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

#eval "$(starship init bash)"
#PS1='[\u@\h \W]\$ '
