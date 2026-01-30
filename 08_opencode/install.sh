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

# Install commands
commands_dir=~/.config/opencode/commands
commands_backup_dir=$SCRIPT_DIR/${timestamp}.commands.backup

if [ -d "$commands_dir" ] && [ "$(ls -A $commands_dir 2>/dev/null)" ]; then
    echo "Creating backup of ${commands_dir} to ${commands_backup_dir}"
    cp -r "${commands_dir}" "${commands_backup_dir}"
fi

echo "Installing commands..."
mkdir -p "$commands_dir"
cp -r "$SCRIPT_DIR/commands/"* "$commands_dir/"

# Install skills
if command -v npx &> /dev/null; then
    echo ""
    echo "Installing skills..."
    npx skills add https://github.com/obra/superpowers --skill '*' -a opencode -g -y
    npx skills add https://github.com/anthropics/skills --skill frontend-design -a opencode -g -y
    npx skills add https://github.com/anthropics/skills --skill skill-creator -a opencode -g -y
fi
