#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")
docker_config_folder="$HOME/.docker"
docker_config_file="$docker_config_folder/config.json"
backup_dir="$SCRIPT_DIR/backups/${timestamp}"

brew bundle install --file="$SCRIPT_DIR/brewfile" --verbose

if [ -f "$docker_config_file" ]; then
	mkdir -p "$backup_dir"
	echo "Creating backup of ${docker_config_file} in ${backup_dir}"
	cp -p "$docker_config_file" "$backup_dir/config.json"
fi

mkdir -p "$docker_config_folder"
echo "Updating docker config ${docker_config_file}"
cp "$SCRIPT_DIR/docker.config.json" "$docker_config_file"
