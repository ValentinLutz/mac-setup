#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")


# Update git config
git_config_file=~/.gitconfig
git_backup_file=$SCRIPT_DIR/${timestamp}.gitconfig.backup

echo "Creating backup of ${git_config_file} to ${git_backup_file}"
cp "${git_config_file}" "${git_backup_file}"

echo "Updating git config ${git_config_file}"
cp "$SCRIPT_DIR/.gitconfig" "${git_config_file}"


# Update git configs
git_configs_folder=~/.gitconfigs
git_configs_backup_folder=$SCRIPT_DIR/${timestamp}.gitconfigs.backup
mkdir -p ${git_configs_folder}

echo "Creating backup of ${git_configs_folder} to ${git_configs_backup_folder}"
cp -rp "${git_configs_folder}" "${git_configs_backup_folder}"

echo "Deleting old git configs"
rm -rf "${git_configs_folder}"/*

echo "Updating default git config ${git_configs_folder}"
cp -rp "$SCRIPT_DIR/.gitconfigs/" "${git_configs_folder}"
