#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

timestamp=$(date +"%Y%m%d_%H%M%S")
opencode_home="${XDG_CONFIG_HOME:-$HOME/.config}/opencode"
claude_home="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
pi_home="${PI_CODING_AGENT_DIR:-$HOME/.pi/agent}"
codex_home="${CODEX_HOME:-$HOME/.codex}"

mkdir -p "$opencode_home" "$claude_home" "$pi_home" "$codex_home"

# Update opencode AGENTS.md
opencode_agents_file="$opencode_home/AGENTS.md"
echo "Creating backup of ${opencode_agents_file}"
cp "${opencode_agents_file}" "$SCRIPT_DIR/${timestamp}.opencode.AGENTS.md.backup" 2>/dev/null
echo "Updating ${opencode_agents_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${opencode_agents_file}"

# Update opencode.json
opencode_config_file="$opencode_home/opencode.json"
echo "Creating backup of ${opencode_config_file}"
cp "${opencode_config_file}" "$SCRIPT_DIR/${timestamp}.opencode.json.backup" 2>/dev/null
echo "Updating ${opencode_config_file}"
cp "$SCRIPT_DIR/opencode/opencode.json" "${opencode_config_file}"

# Update Claude Code CLAUDE.md
claude_md_file="$claude_home/CLAUDE.md"
echo "Creating backup of ${claude_md_file}"
cp "${claude_md_file}" "$SCRIPT_DIR/${timestamp}.claude.CLAUDE.md.backup" 2>/dev/null
echo "Updating ${claude_md_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${claude_md_file}"

# Update Claude Code settings.json
claude_settings_file="$claude_home/settings.json"
echo "Creating backup of ${claude_settings_file}"
cp "${claude_settings_file}" "$SCRIPT_DIR/${timestamp}.claude.settings.json.backup" 2>/dev/null
echo "Updating ${claude_settings_file}"
cp "$SCRIPT_DIR/claude/settings.json" "${claude_settings_file}"

# Update Claude Code status line script
claude_statusline_file="$claude_home/statusline-command.sh"
echo "Creating backup of ${claude_statusline_file}"
cp "${claude_statusline_file}" "$SCRIPT_DIR/${timestamp}.claude.statusline-command.sh.backup" 2>/dev/null
echo "Updating ${claude_statusline_file}"
cp "$SCRIPT_DIR/claude/statusline-command.sh" "${claude_statusline_file}"

# Update pi AGENTS.md
pi_agents_file="$pi_home/AGENTS.md"
echo "Creating backup of ${pi_agents_file}"
cp "${pi_agents_file}" "$SCRIPT_DIR/${timestamp}.pi.AGENTS.md.backup" 2>/dev/null
echo "Updating ${pi_agents_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${pi_agents_file}"

# Update Codex AGENTS.md
codex_agents_file="$codex_home/AGENTS.md"
echo "Creating backup of ${codex_agents_file}"
cp "${codex_agents_file}" "$SCRIPT_DIR/${timestamp}.codex.AGENTS.md.backup" 2>/dev/null
echo "Updating ${codex_agents_file}"
cp "$SCRIPT_DIR/AGENTS.md" "${codex_agents_file}"

# Install shared skills globally for supported agents.
npx skills@1.5.7 add anthropics/skills#main --skill skill-creator -g -a claude-code -a opencode -a pi -y
npx skills@1.5.7 add monkescience/skills#main -g -a claude-code -a opencode -a pi -y
