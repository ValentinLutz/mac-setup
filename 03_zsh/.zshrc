# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

HOMEBREW_PREFIX="$(brew --prefix)"
FPATH="$HOMEBREW_PREFIX/share/zsh/site-functions:${FPATH}"

plugins=(git)

source "$HOMEBREW_PREFIX/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh"
source "$ZSH/oh-my-zsh.sh"

# History configuration
setopt HIST_IGNORE_SPACE

source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# mise configuration
eval "$(mise activate zsh)"

# Go configuration
export PATH="$PATH:$(go env GOPATH)/bin"

# Python configuration
export PATH="$PATH:$HOME/.local/bin"

# fzf configuration
source <(fzf --zsh)

# zoxide configuration
eval "$(zoxide init zsh)"

source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
