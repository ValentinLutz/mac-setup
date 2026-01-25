#!/bin/bash

# Uninstall Claude Code plugins

echo "Uninstalling plugins..."

claude plugin uninstall superpowers@superpowers-marketplace
claude plugin uninstall context7@claude-plugins-official
claude plugin uninstall playwright@claude-plugins-official
claude plugin uninstall frontend-design@claude-plugins-official
claude plugin uninstall feature-dev@claude-plugins-official
claude plugin uninstall commit-commands@claude-plugins-official

echo ""
echo "Removing marketplaces..."
claude plugin marketplace remove superpowers-marketplace

echo ""
echo "Done! Restart Claude Code for changes to take effect."
