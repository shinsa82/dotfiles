# echoing
echo "loading .bash_profile..."

# coreutils, sed, getopt
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/grep/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-getopt/bin:$PATH"
# export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# make
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
# zip, unzip
export PATH="/usr/local/opt/zip/bin:/usr/local/opt/unzip/bin:$PATH"

# Tcl/Tk path override
# export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
# export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
# export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

# dircolors
eval $(dircolors ${HOME}/.local/dircolors-solarized/dircolors.256dark)

# anyenv and pipenv
export PATH="$HOME/.anyenv/bin:$PATH"
# export PYENV_VIRTUALENV_VERBOSE_ACTIVATE=1
eval "$(anyenv init -)"
# eval "$(pyenv init --path)"
# eval "$(pyenv virtualenv-init -)"
# eval "$(scalaenv init -)"
# eval "$(jenv init -)"

# bash completion
# [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# bash completion@2
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# docker
# etc=/Applications/Docker.app/Contents/Resources/etc
# ln -s $etc/docker.bash-completion $(brew --prefix)/etc/bash_completion.d/docker
# ln -s $etc/docker-machine.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-machine
# ln -s $etc/docker-compose.bash-completion $(brew --prefix)/etc/bash_completion.d/docker-compose

# No need to setup PATH for TeXLive

# fzf setting
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --border --height=50% --color=dark"

# JPF setting
# export JPFCORE=/Users/shinsa/git/work/phd/lectures/hagiya/jpf-core-svt18proj/jpf-core
# export PATH="$JPFCORE/bin:$PATH"

# DAML
# export PATH="$PATH:$HOME/.daml/bin"

# # local bin path
# export PATH="$HOME/bin:$PATH"

# opam configuration
# test -r /Users/shinsa/.opam/opam-init/init.sh && . /Users/shinsa/.opam/opam-init/init.sh >/dev/null 2>/dev/null || true

# TeX
export BIBINPUTS=$HOME/git/tex

# F*
# export PATH="$HOME/bin/pkgs/fstar/bin:$PATH"

# # DB2
# . ~/db2profile

# kubectl completion was added to bash_completion.d

# pipenv
# export PIPENV_VENV_IN_PROJECT=1

# go
# export PATH="${GOPATH}/bin:$PATH"

# Poetry (Python version manager)
export PATH="$HOME/.poetry/bin:$PATH"

# XQuartz (X11 server)
export PATH="/usr/X11/bin:$PATH"

# include path for libraries installed via brew
# bzip2, zlib by brew
# export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

# Root folder of Box Drive app
export BOX=$(defaults read com.box.desktop preferences/sync_directory_path)

[[ -f ${HOME}/.bashrc ]] && . ${HOME}/.bashrc
