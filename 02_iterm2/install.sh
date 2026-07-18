#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

brew bundle install --file="$SCRIPT_DIR/brewfile" --verbose
