#!/bin/bash
set -e

# Homebrew
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Formulae and casks
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
section=""
while IFS= read -r line || [[ -n "$line" ]]; do
    [[ -z "$line" ]] && continue
    if [[ "$line" == \[*\] ]]; then
        section="$line"
        continue
    fi
    case "$section" in
        "[formulae]") brew install "$line" ;;
        "[casks]")    brew install --cask "$line" ;;
    esac
done < "$SCRIPT_DIR/mac-requirements.txt"
