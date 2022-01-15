#!/bin/bash

# Customization of keyboard.
# I wanted disble a function of default IME that holding a key enables input of special
#   chars.
# But this did not work.
# Thus currently this is not used.

echo "** disabling entring special charater mode by press-and-hold..."
defaults write -g ApplePressAndHoldEnabled -bool false
