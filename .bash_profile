# echoing
echo "loading .bash_profile..."

# Aliases
alias ls="ls -AF --color=auto"
alias ll="ls -AlF --color=auto"
alias gopath='export GOPATH=$(pwd)'

# coreutils, sed, getopt
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/gnu-getopt/bin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
# make
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"

# Tcl/Tk path override
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
# export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
# export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

# git
git config --global user.name "Shin Saito"
git config --global user.email "shinsa@jp.ibm.com"
git config --global pull.rebase true
git config --global alias.s "status -sb --ignored"
git config --global alias.c commit
git config --global alias.b "branch -a"
git config --global alias.p push
git config --global alias.d diff
alias gl="git log --graph"
alias gt="git tag -n"
alias gb="git branch"
alias gba="git branch -a"
alias gp="git pull --prune"
alias gf="git fetch --prune"
alias gs="git status -sb --ignored"

# prompt
function parse_git_branch {
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/'
}

function set_prompt {
    local  BLUE="\[\e[1;34m\]"
    local  CYAN="\[\e[1;36m\]"
    local  RED="\[\e[1;31m\]"
    local  GREEN="\[\e[0;32m\]"
    local  WHITE="\[\e[00m\]"
    local  GRAY="\[\e[1;37m\]"
    export PS1="[\t ${CYAN}\w${WHITE}]${GREEN}\$(parse_git_branch)${WHITE}\n\\$ "
}

set_prompt

# dircolors
eval $(dircolors ~/dircolors-solarized/dircolors.256dark)

# Add Visual Studio Code (code)
# ln -s "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $HOME/code_bin
export PATH="$HOME/code_bin:$PATH"

# anyenv and pipenv
export PATH="$HOME/.anyenv/bin:$PATH"
export PYENV_VIRTUALENV_VERBOSE_ACTIVATE=1
eval "$(anyenv init -)"
alias av="anyenv versions"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
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
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --border --height=50% --color=dark"

# JPF setting
export JPFCORE=/Users/shinsa/git/work/phd/lectures/hagiya/jpf-core-svt18proj/jpf-core
export PATH="$JPFCORE/bin:$PATH"

# DAML
export PATH="$PATH:$HOME/.daml/bin"

# local bin path
export PATH="$HOME/bin:$PATH"

# opam configuration
test -r /Users/shinsa/.opam/opam-init/init.sh && . /Users/shinsa/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# TeX
export BIBINPUTS=$HOME/git/tex

# F*
export PATH="$HOME/bin/pkgs/fstar/bin:$PATH"

# # DB2
# . ~/db2profile

# kubectl completion was added to bash_completion.d

# pipenv
export PIPENV_VENV_IN_PROJECT=1

# go
export PATH="${GOPATH}/bin:$PATH"

# K8s, OpenShift and S2I
alias k="kubectl"
alias ocs="oc status"
alias ocl="oc login"
eval "$(s2i completion bash)"

# Poetry (Python version manager)
export PATH="$HOME/.poetry/bin:$PATH"

# include path for libraries installed via brew
# bzip2, zlib by brew
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
