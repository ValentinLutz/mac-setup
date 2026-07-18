#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")
backup_dir="$SCRIPT_DIR/backups/${timestamp}"
zsh_config_file="$HOME/.zshrc"

brew bundle install --file="$SCRIPT_DIR/brewfile" --verbose

if [ -f "$zsh_config_file" ]; then
	mkdir -p "$backup_dir"
	echo "Creating backup of ${zsh_config_file} in ${backup_dir}"
	cp -p "$zsh_config_file" "$backup_dir/.zshrc"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
	oh_my_zsh_installer=$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
	sh -c "$oh_my_zsh_installer" "" --unattended
fi

echo "Updating zsh config ${zsh_config_file}"
cp "$SCRIPT_DIR/.zshrc" "${zsh_config_file}"

echo "Restart your terminal or run 'source ${zsh_config_file}' to apply changes."
