#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")
backup_dir="$SCRIPT_DIR/backups/${timestamp}"
opencode_home="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
claude_home="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
pi_home="${PI_CODING_AGENT_DIR:-$HOME/.pi/agent}"
codex_home="${CODEX_HOME:-$HOME/.codex}"

mkdir -p "$opencode_home" "$claude_home" "$pi_home" "$codex_home"

backup_file() {
	local source_file=$1
	local backup_name=$2

	if [ -f "$source_file" ]; then
		mkdir -p "$backup_dir"
		echo "Creating backup of ${source_file} in ${backup_dir}"
		cp -p "$source_file" "$backup_dir/$backup_name"
	fi
}

# Update opencode AGENTS.md
opencode_agents_file="$opencode_home/AGENTS.md"
backup_file "$opencode_agents_file" "opencode.AGENTS.md"
echo "Updating ${opencode_agents_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${opencode_agents_file}"

# Update opencode.json
opencode_config_file="$opencode_home/opencode.json"
backup_file "$opencode_config_file" "opencode.json"
echo "Updating ${opencode_config_file}"
cp "$SCRIPT_DIR/opencode/opencode.json" "${opencode_config_file}"

# Update Claude Code CLAUDE.md
claude_md_file="$claude_home/CLAUDE.md"
backup_file "$claude_md_file" "claude.CLAUDE.md"
echo "Updating ${claude_md_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${claude_md_file}"

# Update Claude Code settings.json
claude_settings_file="$claude_home/settings.json"
backup_file "$claude_settings_file" "claude.settings.json"
echo "Updating ${claude_settings_file}"
cp "$SCRIPT_DIR/claude/settings.json" "${claude_settings_file}"

# Update Claude Code status line script
claude_statusline_file="$claude_home/statusline-command.sh"
backup_file "$claude_statusline_file" "claude.statusline-command.sh"
echo "Updating ${claude_statusline_file}"
cp "$SCRIPT_DIR/claude/statusline-command.sh" "${claude_statusline_file}"

# Update pi AGENTS.md
pi_agents_file="$pi_home/AGENTS.md"
backup_file "$pi_agents_file" "pi.AGENTS.md"
echo "Updating ${pi_agents_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${pi_agents_file}"

# Update Codex AGENTS.md
codex_agents_file="$codex_home/AGENTS.md"
backup_file "$codex_agents_file" "codex.AGENTS.md"
echo "Updating ${codex_agents_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${codex_agents_file}"

# Install shared skills globally for supported agents.
mise exec -- npx skills@1.5.7 add anthropics/skills#main --skill skill-creator -g -a claude-code -a opencode -a pi -a codex -y
mise exec -- npx skills@1.5.7 add monkescience/skills#main -g -a claude-code -a opencode -a pi -a codex -y
