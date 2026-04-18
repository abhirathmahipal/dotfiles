#!/usr/bin/env bash
set -e

DOTFILES_VSCODE="$(cd "$(dirname "$0")/VSCode" && pwd)"

# Detect OS and set VSCode user settings directory
if [[ "$(uname)" == "Darwin" ]]; then
    VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
else
    VSCODE_USER_DIR="$HOME/.config/Code/User"
fi

echo "==> Copying settings.json..."
mkdir -p "$VSCODE_USER_DIR"
cp "$DOTFILES_VSCODE/settings.json" "$VSCODE_USER_DIR/settings.json"

echo "==> Checking for 'code' CLI..."
if ! command -v code &>/dev/null; then
    echo ""
    echo "Warning: 'code' CLI not found. Skipping extension installation."
    echo "To install extensions manually, open VSCode and run:"
    echo "  Shell Command: Install 'code' command in PATH"
    echo "Then re-run this script, or install extensions individually:"
    echo "  code --install-extension vscodevim.vim"
    echo "  code --install-extension esbenp.prettier-vscode"
    echo "  code --install-extension ms-python.vscode-pylance"
    echo "  code --install-extension golang.go"
else
    echo "==> Installing extensions..."
    code --install-extension vscodevim.vim
    code --install-extension esbenp.prettier-vscode
    code --install-extension ms-python.vscode-pylance
    code --install-extension golang.go
fi

if [[ "$(uname)" == "Darwin" ]]; then
    echo "==> Enabling key repeat..."
    defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
fi

echo ""
echo "Done."
