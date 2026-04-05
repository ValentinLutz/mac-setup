#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")

mkdir -p ~/.config/opencode
mkdir -p ~/.claude

# Update opencode AGENTS.md
opencode_agents_file=~/.config/opencode/AGENTS.md
echo "Creating backup of ${opencode_agents_file}"
cp "${opencode_agents_file}" "$SCRIPT_DIR/${timestamp}.opencode.AGENTS.md.backup" 2>/dev/null
echo "Updating ${opencode_agents_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${opencode_agents_file}"

# Update opencode.json
opencode_config_file=~/.config/opencode/opencode.json
echo "Creating backup of ${opencode_config_file}"
cp "${opencode_config_file}" "$SCRIPT_DIR/${timestamp}.opencode.json.backup" 2>/dev/null
echo "Updating ${opencode_config_file}"
cp "$SCRIPT_DIR/opencode/opencode.json" "${opencode_config_file}"

# Update Claude Code CLAUDE.md
claude_md_file=~/.claude/CLAUDE.md
echo "Creating backup of ${claude_md_file}"
cp "${claude_md_file}" "$SCRIPT_DIR/${timestamp}.claude.CLAUDE.md.backup" 2>/dev/null
echo "Updating ${claude_md_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${claude_md_file}"

# Update Claude Code settings.json
claude_settings_file=~/.claude/settings.json
echo "Creating backup of ${claude_settings_file}"
cp "${claude_settings_file}" "$SCRIPT_DIR/${timestamp}.claude.settings.json.backup" 2>/dev/null
echo "Updating ${claude_settings_file}"
cp "$SCRIPT_DIR/claude/settings.json" "${claude_settings_file}"
