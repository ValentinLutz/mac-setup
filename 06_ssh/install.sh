#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")
ssh_config_folder="$HOME/.ssh"
ssh_config_file="$ssh_config_folder/config"
backup_dir="$SCRIPT_DIR/backups/${timestamp}"

if [ -f "$ssh_config_file" ]; then
	mkdir -p "$backup_dir"
	echo "Creating backup of ${ssh_config_file} in ${backup_dir}"
	cp -p "$ssh_config_file" "$backup_dir/config"
fi

echo "Updating ssh config ${ssh_config_file}"
mkdir -p "$ssh_config_folder"
chmod 700 "$ssh_config_folder"
cp "$SCRIPT_DIR/config" "${ssh_config_file}"
chmod 600 "$ssh_config_file"
