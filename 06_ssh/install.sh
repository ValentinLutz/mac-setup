#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")


# Update ssh config
ssh_config_file=~/.ssh/config
ssh_backup_file=$SCRIPT_DIR/${timestamp}.config.backup

echo "Creating backup of ${ssh_config_file} to ${ssh_backup_file}"
cp "${ssh_config_file}" "${ssh_backup_file}"

echo "Updating ssh config ${ssh_config_file}"
cp "$SCRIPT_DIR/config" "${ssh_config_file}"
