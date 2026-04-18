#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "==> Copying .shell_common..."
cp "$DOTFILES/.shell_common" "$HOME/.shell_common"

echo "==> Copying .zshrc..."
cp "$DOTFILES/.zshrc" "$HOME/.zshrc"

echo ""
echo "Done."
echo "Reload your shell with: source ~/.zshrc"
