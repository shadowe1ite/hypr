if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
#zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light hlissner/zsh-autopair

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
eval "$(starship init zsh)"

# export
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/opt/metasploit/tools/exploit
export PATH=$PATH:/usr/share/firmware-mod-kit
export PATH=$PATH:/opt/android-sdk/build-tools/35.0.0/
export PATH=$PATH:$HOME/go/bin/
export TERM=xterm-256color
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#575656'
export MANPAGER='nvim +Man!'
export MPD_HOST=127.0.0.1
export MPD_PORT=6690
export DOTS="/opt/dots/" 

# sec
export payloads=/mnt/storage/payloads/ 
export rockyou=$payloads/SecLists/Passwords/Leaked-Databases/rockyou.txt


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[w' kill-region

# HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
zstyle ":completion:*:commands" rehash 1

# alias
alias ls="ls --color=auto -1t"
alias cp="cp -iv"
alias mv="mv -iv"
alias ls="exa" 
alias vi="nvim"
alias vim="nvim"
alias hs="history 1 | cut -c 8- | sort | uniq | fzf | tr -d '\\n' | wl-copy"
alias grep="grep --color"
alias pacman="pacman --color auto"
alias zathura="zaread"
alias sioyek="zaread"
alias hyprpm="hyprpm -v"
alias cat="bat"
alias icat="/bin/cat"
alias psql="sudo -u postgres psql"
alias gf="/bin/gf"
alias gau="/bin/gau"
alias proxychains='proxychains -q'
alias lfimap="/usr/share/lfimap/lfimap/lfimap.py"
alias alacritty="kitty"
alias syncdots
#alias httpx="httpx -no-color"
source /mnt/storage/scripts/.alias

# Fn
fn hyprsync(){
    packages=("hyprutils" "hyprlang" "hyprwayland-scanner" "aquamarine-git" "hyprland" "xdg-desktop-portal-hyprland" "hypridle" "hyprlock" "hyprpolkitagent")
    hyprctl notify 0 5000 "rgb(FF642B)" "  Updating Hyprland Pkgs"
    yay -Sy --noconfirm
    for pkg in "${packages[@]}"; do
        hyprctl notify 1 5000 "rgb(8AADF4)" "  Installing $pkg"
        yay -Sydd --noconfirm "$pkg"
        if [ $? -ne 0 ]; then
            hyprctl notify 3 5000 "rgb(EF5350)" "  $pkg Failed to Install"
        else
            hyprctl notify 5 5000 "rgb(22DA6E)" "  $pkg Installed Successfully"
        fi
    done
}

fn syncdots() {
  case "${1:--s}" in
    -s) (cd "$DOTS" && stow --adopt -t "$HOME" */) ;; # Sync
    -r) (cd "$DOTS" && stow -D -d /opt/dots -t $HOME */) ;;                # Remove
    *) echo "Usage: dotfiles [-s | -r | -R]" && return 1 ;;
  esac
}

fn cuser() {
  if [ "$1" = "-d" ]; then
    user=$2
    [ -z "$user" ] && echo "Usage: cuser -d <username>" && return 1

    echo "[*] Unstowing dotfiles for '$user'..."
    sudo -u "$user" bash -c "cd /opt/dots && stow -D -t /home/$user */"

    echo "[*] Deleting user '$user' and home directory..."
    sudo userdel -r "$user"

    echo "[✓] User '$user' deleted."
    return 0
  fi

  user=$1
  [ -z "$user" ] && echo "Usage: cuser <username> or cuser -d <username>" && return 1

  sudo useradd -m -s /bin/zsh "$user"
  sudo passwd "$user"
  sudo usermod -aG dotusers "$user"

  sudo chown -R root:dotusers /opt/dots
  sudo chmod -R 2775 /opt/dots
  sudo -u "$user" xdg-user-dirs-update
  sudo gpasswd -a $user input
  sudo -u "$user" bash -c "cd /opt/dots && stow --adopt -t /home/$user */"

  echo "[✓] User '$user' created and added to 'dotusers'."
}

# If not running interactively, don't do anything
#[[ $- != *i* ]] && return

#PS1='[\u@\h \W]\$ '
export PATH=$PATH:/home/shadow/.spicetify
#source "/usr/lib/emsdk/emsdk_env.sh"

# bun completions
[ -s "/home/shadow/.bun/_bun" ] && source "/home/shadow/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -f /opt/miniconda/etc/profile.d/conda.sh ] && source /opt/miniconda/etc/profile.d/conda.sh

export PATH=/home/shadow/.pdtm/go/bin:$PATH
export PATH=/home/shadow/go/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

[ -f ~/explicit_filter.restore ] && rm ~/explicit_filter.restore

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

[ ! -f "$HOME/.x-cmd.root/X" ] || . "$HOME/.x-cmd.root/X" # boot up x-cmd.

# Golang environment variables
export GOROOT=/usr/lib/go
export PATH=$PATH:$GOROOT/bin
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/shadow/.dart-cli-completion/zsh-config.zsh ]] && . /home/shadow/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
#

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  #exec tmux -u
fi

