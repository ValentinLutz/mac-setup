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

# Java configuration
export JAVA_11_HOME=$(/usr/libexec/java_home -v11)
export JAVA_17_HOME=$(/usr/libexec/java_home -v17)
export JAVA_21_HOME=$(/usr/libexec/java_home -v21)

alias java11='export JAVA_HOME=$JAVA_11_HOME'
alias java17='export JAVA_HOME=$JAVA_17_HOME'
alias java21='export JAVA_HOME=$JAVA_21_HOME'

export JAVA_HOME=$JAVA_21_HOME

# Node configuration
alias node18='export PATH="/opt/homebrew/opt/node@18/bin:$PATH"'
alias node20='export PATH="/opt/homebrew/opt/node@20/bin:$PATH"'
