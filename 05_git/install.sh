#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")
backup_dir="$SCRIPT_DIR/backups/${timestamp}"

git_config_file="$HOME/.gitconfig"
git_configs_folder="$HOME/.gitconfigs"

if [ -f "$git_config_file" ] || [ -d "$git_configs_folder" ]; then
	mkdir -p "$backup_dir"
fi

if [ -f "$git_config_file" ]; then
	echo "Creating backup of ${git_config_file} in ${backup_dir}"
	cp -p "$git_config_file" "$backup_dir/.gitconfig"
fi

if [ -d "$git_configs_folder" ]; then
	echo "Creating backup of ${git_configs_folder} in ${backup_dir}"
	cp -Rp "$git_configs_folder" "$backup_dir/.gitconfigs"
fi

echo "Updating git config ${git_config_file}"
cp "$SCRIPT_DIR/.gitconfig" "${git_config_file}"

echo "Updating default git config ${git_configs_folder}"
mkdir -p "$git_configs_folder"
cp -Rp "$SCRIPT_DIR/.gitconfigs/" "$git_configs_folder"
