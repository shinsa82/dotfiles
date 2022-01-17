#!/bin/bash
# update brew and packages
echo "** updating brew and packages..."
echo "** updating brew..."
brew update
echo "** updating brew packages..."
brew upgrade
echo "** autoremoving..."
brew autoremove
echo "** done."
