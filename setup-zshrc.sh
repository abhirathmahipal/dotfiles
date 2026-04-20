#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "==> Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "==> Copying .shell_common..."
cp "$DOTFILES/.shell_common" "$HOME/.shell_common"

echo "==> Copying .zshrc..."
cp "$DOTFILES/.zshrc" "$HOME/.zshrc"

echo ""
echo "Done."
echo "Reload your shell with: source ~/.zshrc"
