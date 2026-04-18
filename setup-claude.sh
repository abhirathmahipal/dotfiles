#!/usr/bin/env bash
set -e

DOTFILES_CLAUDE="$(cd "$(dirname "$0")/Claude" && pwd)"

echo "==> Copying keybindings.json..."
mkdir -p "$HOME/.claude"
cp "$DOTFILES_CLAUDE/keybindings.json" "$HOME/.claude/keybindings.json"

echo ""
echo "Done."
