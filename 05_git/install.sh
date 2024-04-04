#!/bin/bash

timestamp=$(date +"%Y%m%d_%H%M%S")


# Update git config
git_config_file=~/.gitconfig
git_backup_file=${timestamp}.gitconfig.backup

echo "Creating backup of ${git_config_file} to ${git_backup_file}"
cp "${git_config_file}" "${git_backup_file}"

echo "Updating git config ${git_config_file}"
cp ./.gitconfig "${git_config_file}"
