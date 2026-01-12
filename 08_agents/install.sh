#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p ~/.claude
cp "$SCRIPT_DIR/template.md" ~/.claude/CLAUDE.md

echo "Installed: ~/.claude/CLAUDE.md"
