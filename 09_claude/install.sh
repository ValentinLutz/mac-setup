#!/bin/bash

# Install Claude Code plugins
# Requires Claude Code CLI to be installed

echo "Adding plugin marketplaces..."
claude plugin marketplace add obra/superpowers-marketplace
claude plugin marketplace add anthropics/claude-plugins-official

echo ""
echo "Installing plugins..."

# From superpowers-marketplace
claude plugin install superpowers@superpowers-marketplace

# From claude-plugins-official
claude plugin install context7@claude-plugins-official
claude plugin install playwright@claude-plugins-official
claude plugin install frontend-design@claude-plugins-official
claude plugin install feature-dev@claude-plugins-official
claude plugin install commit-commands@claude-plugins-official

echo ""
echo "Done! Restart Claude Code for plugins to take effect."
