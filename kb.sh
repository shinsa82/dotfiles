#!/bin/bash
# customization of keyboard

echo "** disabling entring special charater mode by press-and-hold..."
defaults write -g ApplePressAndHoldEnabled -bool false
