#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "==> Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

if ! command -v fzf > /dev/null; then
    if command -v brew > /dev/null; then
        echo "==> Installing fzf..."
        brew install fzf
    else
        echo "==> fzf not found. Install it for enhanced reverse search: brew install fzf"
    fi
fi

echo "==> Copying .shell_common..."
cp "$DOTFILES/.shell_common" "$HOME/.shell_common"

echo "==> Copying .zshrc..."
cp "$DOTFILES/.zshrc" "$HOME/.zshrc"

echo "==> Copying .zsh_extras..."
cp "$DOTFILES/.zsh_extras" "$HOME/.zsh_extras"

echo ""
echo "Done. Reload your shell with: source ~/.zshrc"
