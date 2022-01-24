#!/bin/bash
# brew setup script

set -e

echo "** installing brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew --version

echo "** installing packages..."
brew install bash
brew install bash-completion@2

brew install grep coreutils make # Note: --with-default-names deprecated.

brew install jq
brew install gzip
brew install tree
brew install nkf
brew install suin/suin/git-remind
brew install fzf
brew install openssh
brew install anyenv
brew install graphviz

# cask formulae
brew install --cask google-chrome karabiner-elements visual-studio-code \
    google-japanese-ime roboform adobe-acrobat-reader docker

brew install helm minikube # also installes kubernetes-cli, but it conflicts with kubectl from docker
brew link --overwrite kubernetes-cli # overwrite the symlink

echo "** installed."
