#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")

brew bundle install --file="$SCRIPT_DIR/brewfile" --verbose


# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Update zsh config
zsh_config_file=~/.zshrc
zsh_backup_file=$SCRIPT_DIR/${timestamp}.zshrc.backup

echo "Creating backup of ${zsh_config_file} to ${zsh_backup_file}"
cp "${zsh_config_file}" "${zsh_backup_file}"

echo "Updating zsh config ${zsh_config_file}"
cp "$SCRIPT_DIR/.zshrc" "${zsh_config_file}"

echo "Restart your terminal or run 'source ${zsh_config_file}' to apply changes."
