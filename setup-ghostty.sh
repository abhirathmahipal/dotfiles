#!/usr/bin/env bash
set -e

DOTFILES_GHOSTTY="$(cd "$(dirname "$0")/Ghostty" && pwd)"
GHOSTTY_CONFIG_DIR="$HOME/.config/ghostty"

echo "==> Copying Ghostty config..."
mkdir -p "$GHOSTTY_CONFIG_DIR"
cp "$DOTFILES_GHOSTTY/config" "$GHOSTTY_CONFIG_DIR/config"

echo ""
echo "Done."
