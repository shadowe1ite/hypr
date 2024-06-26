## Zap Plugins
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
#export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=cyan,bg=#ff00ff,bold'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#575656'
# nvidia
#export __GLX_VENDOR_LIBRARY_NAME=nvidia glxinfo | grep 'OpenGL renderer string'

# HISTORY
HISTFILE=~/.zsh_history
SAVEHIST=1000

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
alias zathura="zaread"
alias sioyek="zaread"
alias hyprpm="hyprpm -v"
alias cat="bat"
#alias yay="yay -S --color --editmenu --editor nvim"
#alias mpv="prime-run mpv"
#alias cat="bat"

eval $(thefuck --alias)
#pokeget --hide-name random

# Fn
fn hyprsync(){
    packages=("hyprutils-git" "hyprlang-git" "hyprwayland-scanner-git" "hyprland-git" "xdg-desktop-portal-hyprland-git" "hypridle-git" "hyprlock-git")
    hyprctl notify 0 5000 "rgb(FF642B)" "  Updating Hyprland Pkgs"
    yay -Sy --noconfirm
    for pkg in "${packages[@]}"; do
        hyprctl notify 1 5000 "rgb(8AADF4)" "  Installing $pkg"
        yay -S --noconfirm "$pkg"
        if [ $? -ne 0 ]; then
            hyprctl notify 3 5000 "rgb(EF5350)" "  $pkg Failed to Install"
        else
            hyprctl notify 5 5000 "rgb(22DA6E)" "  $pkg Installed Successfully"
        fi
    done
}

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

eval "$(starship init zsh)"
#PS1='[\u@\h \W]\$ '
# https://github.com/KZDKM/Hyprspace
# https://github.com/hyprwm/hyprland-plugins
export PATH=$PATH:/home/shadow/.spicetify
