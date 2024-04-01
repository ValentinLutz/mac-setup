#!/bin/bash

timestamp=$(date +"%Y%m%d_%H%M%S")

brew bundle install --file=./brewfile --verbose


# Update docker config
docker_config_file=~/.docker/config.json
docker_backup_file=${timestamp}.docker.config.json.backup

echo "Creating backup of ${docker_config_file} to ${docker_backup_file}"
cp "${docker_config_file}" "${docker_backup_file}"

echo "Updating docker config ${docker_config_file}"
cp ./docker.config.json "${docker_config_file}"


# Update colima config
colima_config_file=~/.colima/default/colima.yaml
colima_backup_file=${timestamp}.colima.yaml.backup

echo "Creating backup of ${colima_config_file} to ${backup_file}"
cp "${colima_config_file}" "${colima_backup_file}"

echo "Updating colima config"
cp ./colima.yaml "${colima_config_file}"

echo "Restarting colima"
brew services restart colima