#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")

mkdir -p ~/.config/opencode

# Update AGENTS.md
agents_config_file=~/.config/opencode/AGENTS.md
agents_backup_file=$SCRIPT_DIR/${timestamp}.AGENTS.md.backup

echo "Creating backup of ${agents_config_file} to ${agents_backup_file}"
cp "${agents_config_file}" "${agents_backup_file}"


echo "Updating config ${agents_config_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${agents_config_file}"

# Update opencode.json
opencode_config_file=~/.config/opencode/opencode.json
opencode_backup_file=$SCRIPT_DIR/${timestamp}.opencode.json.backup


echo "Creating backup of ${opencode_config_file} to ${opencode_backup_file}"
cp "${opencode_config_file}" "${opencode_backup_file}"


echo "Updating config ${opencode_config_file}"
cp "$SCRIPT_DIR/opencode.json" "${opencode_config_file}"
