#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")

aws_config_folder="$HOME/.aws"
aws_config_file="$aws_config_folder/config"
backup_dir="$SCRIPT_DIR/backups/${timestamp}"

mkdir -p "${aws_config_folder}"

if [ -f "${aws_config_file}" ]; then
	mkdir -p "$backup_dir"
	echo "Creating backup of ${aws_config_file} in ${backup_dir}"
	cp -p "${aws_config_file}" "$backup_dir/config"
fi

echo "Updating aws config ${aws_config_file}"
cp "$SCRIPT_DIR/config" "${aws_config_file}"
