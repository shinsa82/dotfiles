#!/bin/bash
anyenv install --init

# anyenv-update
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

anyenv install goenv
anyenv install jenv
anyenv install nodenv
anyenv install pyenv
anyenv install scalaenv
anyenv install hsenv
