#!/bin/bash
# update brew and packages
echo "** updating brew and packages..."
brew update
brew upgrade
brew autoremove
echo "** done."
