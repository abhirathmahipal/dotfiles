#!/usr/bin/env bash
set -e

DOTFILES_VIM="$(cd "$(dirname "$0")/Vim" && pwd)"

echo "==> Copying .vimrc..."
cp "$DOTFILES_VIM/.vimrc" "$HOME/.vimrc"

echo "==> Downloading latest vim-plug..."
mkdir -p "$HOME/.vim/autoloadvimplug/autoload"
curl -fLo "$HOME/.vim/autoloadvimplug/autoload/plug.vim" \
    "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

echo "==> Installing plugins..."
# -u NONE skips auto-loading vimrc so we control how it's sourced
# silent! source suppresses colorscheme errors (plugin not installed yet on first run)
# --not-a-term suppresses all "Press ENTER" prompts from git submodule output
vim --not-a-term -u NONE -c "silent! source $HOME/.vimrc" +PlugInstall +qall

echo ""
echo "Done."
echo "Note: YouCompleteMe requires a compile step:"
echo "  cd ~/.vim/plugins/YouCompleteMe && python3 install.py"
