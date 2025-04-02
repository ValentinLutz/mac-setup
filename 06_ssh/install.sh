#!/bin/bash

timestamp=$(date +"%Y%m%d_%H%M%S")


# Update ssh config
ssh_config_file=~/.ssh/config
ssh_backup_file=${timestamp}.config.backup

echo "Creating backup of ${ssh_config_file} to ${ssh_backup_file}"
cp "${ssh_config_file}" "${ssh_backup_file}"

echo "Updating ssh config ${ssh_config_file}"
cp ./config "${ssh_config_file}"
