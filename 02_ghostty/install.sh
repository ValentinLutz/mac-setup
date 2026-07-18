#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")
ghostty_config_folder="${XDG_CONFIG_HOME:-$HOME/.config}/ghostty"
ghostty_config_file="$ghostty_config_folder/config"
backup_dir="$SCRIPT_DIR/backups/${timestamp}"

brew bundle install --file="$SCRIPT_DIR/brewfile" --verbose

if [ -f "$ghostty_config_file" ]; then
	mkdir -p "$backup_dir"
	echo "Creating backup of ${ghostty_config_file} in ${backup_dir}"
	cp -p "$ghostty_config_file" "$backup_dir/config"
fi

mkdir -p "$ghostty_config_folder"
echo "Updating ghostty config ${ghostty_config_file}"
cp "$SCRIPT_DIR/config" "$ghostty_config_file"
