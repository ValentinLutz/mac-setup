#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")

aws_config_folder=~/.aws
aws_config_file=${aws_config_folder}/config
aws_backup_file=$SCRIPT_DIR/${timestamp}.aws.config.backup

mkdir -p "${aws_config_folder}"

if [ -f "${aws_config_file}" ]; then
  echo "Creating backup of ${aws_config_file} to ${aws_backup_file}"
  cp "${aws_config_file}" "${aws_backup_file}"
fi

echo "Updating aws config ${aws_config_file}"
cp "$SCRIPT_DIR/config" "${aws_config_file}"
