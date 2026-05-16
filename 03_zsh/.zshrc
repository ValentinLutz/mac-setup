# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

plugins=(git)

source $ZSH/oh-my-zsh.sh

source $HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Go configuration
export PATH=$PATH:$(go env GOPATH)/bin

# Python configuration
export PATH=$PATH:~/.local/bin

# mise configuration
eval "$(mise activate zsh)"

# fzf configuration
source <(fzf --zsh)

# zoxide configuration
eval "$(zoxide init zsh)"
