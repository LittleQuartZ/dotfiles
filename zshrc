# history options
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt share_history          # share command history data

# general options
setopt autocd
setopt interactivecomments
setopt magicequalsubst
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt
setopt MENU_COMPLETE       # Automatically highlight first element of completion menu
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.

bindkey -v

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
   [[ $1 = 'block' ]]; then
  echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
      [[ ${KEYMAP} == viins ]] ||
      [[ ${KEYMAP} = '' ]] ||
      [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
  }
  zle -N zle-keymap-select

  # Use beam shape cursor on startup.
  echo -ne '\e[5 q'

  # Use beam shape cursor for each new prompt.
  preexec() {
     echo -ne '\e[5 q'
}

autoload -Uz compinit
compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# Define completers
zstyle ':completion:*' completer _extensions _complete _approximate

# zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
# zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
# zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
# zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:*:*:corrections' format '(errors: %e)'
zstyle ':completion:*:*:*:*:descriptions' format '%d'
zstyle ':completion:*:*:*:*:messages' format '%d'
zstyle ':completion:*:*:*:*:warnings' format 'no matches found'

zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Only display some tags for the command cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

# source plugins
source /usr/share/fzf/key-bindings.zsh
source /usr/share/zsh/plugins/fzf-tab-bin-git/fzf-tab.plugin.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg={{ grey0 }},underline"

# tty
# if [ "$TERM" = "linux" ] ; then
#     echo -en "\e]P02B3339\e]P7D3C6AA"
# fi

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0{{replace bg0 "#" ""}}" #black
    echo -en "\e]P8{{replace grey0 "#" ""}}" #darkgrey
    echo -en "\e]P1{{replace red "#" ""}}" #darkred
    echo -en "\e]P9{{replace red "#" ""}}" #red
    echo -en "\e]P2{{replace green "#" ""}}" #darkgreen
    echo -en "\e]PA{{replace green "#" ""}}" #green
    echo -en "\e]P3{{replace orange "#" ""}}" #brown
    echo -en "\e]PB{{replace yellow "#" ""}}" #yellow
    echo -en "\e]P4{{replace blue "#" ""}}" #darkblue
    echo -en "\e]PC{{replace blue "#" ""}}" #blue
    echo -en "\e]P5{{replace purple "#" ""}}" #darkmagenta
    echo -en "\e]PD{{replace purple "#" ""}}" #magenta
    echo -en "\e]P6{{replace aqua "#" ""}}" #darkcyan
    echo -en "\e]PE{{replace aqua "#" ""}}" #cyan
    echo -en "\e]P7{{replace grey2 "#" ""}}" #lightgrey
    echo -en "\e]PF{{replace fg "#" ""}}" #white
    clear #for background artifacting
fi

# custom function
toppy() {
    history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n 21
}

cd() {
	builtin cd "$@" && command ls --group-directories-first --color=auto -F
}

mcd () {
    mkdir -p $1
    cd $1
}

vg() {
  local file
  local line

  read -r file line <<<"$(ag --nobreak --noheading $@ | fzf -0 -1 | awk -F: '{print $1, $2}')"

  if [[ -n $file ]]
  then
     nvim $file +$line
  fi
}

man() {
    export LESS_TERMCAP_md=$'\e[01;31m' 
    export LESS_TERMCAP_me=$'\e[0m' 
    export LESS_TERMCAP_us=$'\e[01;32m' 
    export LESS_TERMCAP_ue=$'\e[0m' 
    # export LESS_TERMCAP_so=$'\e[45;93m' \
    # export LESS_TERMCAP_se=$'\e[0m' \

    command man "$@"
}

touch() {
  if [[ "$@" = */* ]]; then
    mkdir -p "${@%/*}"
  fi

  command touch "$@"
}

kitwin(){
  local windows=$(kitty @ ls)
  local selected=$(echo $windows | jq '.[] | select(.is_focused) | .tabs | .[] | .windows | .[] | .title' | fzf | sed 's/\"//g')
  local pid=$(echo $windows | jq '.[] | select(.is_focused) | .tabs | .[] | .windows | .[] | select(.title == $selected) | .pid' --arg selected "$selected")
  kitty @ focus-window -m=pid:"$pid"
}

# alias
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias mirror-update='sudo reflector --verbose -c Indonesia -c Japan -c Singapore --latest 5 --sort rate --save /etc/pacman.d/mirrorlist'
alias mtar='tar -zcvf' # mtar <archive_compress>
alias utar='tar -zxvf' # utar <archive_decompress> <file_list>
alias z='zip -r' # z <archive_compress> <file_list>
alias uz='unzip' # uz <archive_decompress> -d <dir>
alias sr='source ~/.zshrc'
alias ..="cd .."
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e" 
alias mkdir="mkdir -p"
alias fm='ranger'
alias fl='fc-list | fzf'
alias pacs="pacman -Slq | fzf -m --preview 'cat <(pacman -Si {1}) <(pacman -Fl {1} | awk \"{print \$2}\")' | xargs -ro sudo pacman -S"
alias pars="paru -Slq | fzf -m --preview 'cat <(paru -Si {1}) <(paru -Fl {1} | awk \"{print \$2}\")' | xargs -ro  paru -S"
alias pacr="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"
alias p="pacman -Q | fzf"
alias wifi="nmtui-connect"
alias ls="exa --color=auto --icons --sort type"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree --level 2"
alias cat="bat --color always --plain"
alias grep='grep --color=auto'
alias v='nvim'
alias vf='fzf | xargs -ro nvim'
alias mv='mv -v'
alias cp='cp -vr'
alias rm='rm -vr'
alias pfetch="echo ; pfetch"

alias d="kitty +kitten diff"
alias gd="git difftool --no-symlinks --dir-diff"

alias sctl='sudo systemctl'

alias gcb='git branch --list | fzf | sed 's/\*//' | xargs -ro git checkout'
alias glf="git log --pretty='format:%C(auto)%aN %C(auto)%h (%s, %as)' | fzf | cut -d ' ' -f 2 | xargs -ro git log -p -n 1"

export FZF_DEFAULT_OPTS='--color=bg+:{{ bg5 }},bg:{{ bg2 }},spinner:{{ orange }},hl:{{ red }} --color=fg:{{ fg }},header:{{ red }},info:{{ purple }},pointer:{{ orange }} --color=marker:{{ orange }},fg+:{{ yellow }},prompt:{{ purple }},hl+:{{ red }}'
export FZF_DEFAULT_COMMAND='rg --files'

path+=('/home/syahdan/.local/bin')
path+=('/home/syahdan/.yarn/bin')
path+=('/home/syahdan/.local/share/cargo/bin')
export PATH
export EDITOR="nvim"
export TERMINAL="kitty"
export SUDO_PROMPT='[] syahdan, '
export BAT_THEME="base16"
export SCREENRC="$HOME/.config/screen/screenrc"
export CARGO_HOME="$HOME/.local/share/cargo"
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc"
export NODE_REPL_HISTORY="$HOME/.local/share/node_repl_history"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$HOME/.config/java"
export RUSTUP_HOME="$HOME/.local/share/rustup"
alias wget="wget --hsts-file=$HOME/.local/share/wget-hsts"
export XINITRC="$HOME/.config/X11/xinitrc"

meow print --colour 32

# if [ -n "$DESKTOP_SESSION" ];then
#     eval $(gnome-keyring-daemon --start)
#     export SSH_AUTH_SOCK
# fi

# init starship
eval "$(starship init zsh)"

source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
eval "$(fnm env --use-on-cd)"
eval $(thefuck --alias)

# setup starship custom prompt

# bun completions
[ -s "/home/syahdan/.bun/_bun" ] && source "/home/syahdan/.bun/_bun"

# bun
export BUN_INSTALL="/home/syahdan/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
