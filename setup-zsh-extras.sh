#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "$0")" && pwd)"

echo "==> Copying .zsh_extras..."
cp "$DOTFILES/.zsh_extras" "$HOME/.zsh_extras"

ZSHRC="$HOME/.zshrc"
SOURCE_LINE='[ -f ~/.zsh_extras ] && . ~/.zsh_extras'

if grep -qF "$SOURCE_LINE" "$ZSHRC" 2>/dev/null; then
    echo "==> ~/.zshrc already sources .zsh_extras, skipping."
else
    echo "" >> "$ZSHRC"
    echo "$SOURCE_LINE" >> "$ZSHRC"
    echo "==> Added source line to ~/.zshrc"
fi

# Install fzf if missing (unlocks best reverse-search experience)
if ! command -v fzf > /dev/null; then
    if command -v brew > /dev/null; then
        echo "==> Installing fzf via Homebrew for enhanced reverse search..."
        brew install fzf
    else
        echo "==> fzf not found. Install it for enhanced reverse search: brew install fzf"
    fi
fi

echo ""
echo "Done. Reload your shell with: source ~/.zshrc"
