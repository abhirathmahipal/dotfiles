#!/bin/bash
set -e

# Trackpad speed (default: 1.0)
defaults write -g com.apple.trackpad.scaling -float 2

# Natural scrolling off (default: on)
defaults write -g com.apple.swipescrolldirection -bool false

# Keyboard — faster key repeat (defaults: KeyRepeat=6, InitialKeyRepeat=25)
defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15

echo "Done. Log out and back in (or restart) for all changes to take effect."
