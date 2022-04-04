export PATH=$HOME/.local/bin:/usr/local/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"

ZSH_AUTOSUGGEST_STRATEGY=(completion history)

ZSH_THEME=""
plugins=(git archlinux zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

meow print --colour 35
eval "$(starship init zsh)"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

eval $(thefuck --alias)
