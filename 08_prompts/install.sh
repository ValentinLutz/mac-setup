#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")

mkdir -p ~/.claude

config_file=~/.claude/CLAUDE.md
backup_file=$SCRIPT_DIR/${timestamp}.CLAUDE.md.backup

if [ -f "$config_file" ]; then
    echo "Creating backup of ${config_file} to ${backup_file}"
    cp "${config_file}" "${backup_file}"
fi

cp "$SCRIPT_DIR/template.md" "$config_file"

echo "Installed: ${config_file}"
