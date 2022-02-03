if [ -z "$PS1" ]; then
    return
fi 

echo "loading .bashrc..."

# Aliases
alias ls="ls -AF --color=auto"
alias ll="ls -AlF --color=auto"

alias gopath='export GOPATH=$(pwd)'

alias gl="git log --graph"
alias gt="git tag -n"
alias gb="git branch"
alias gba="git branch -a"
alias gp="git pull --prune"
alias gf="git fetch --prune"
alias gs="git status -sb --ignored"

# K8s, OpenShift and S2I
alias k="kubectl"
alias ocs="oc status"
alias ocl="oc login"

# completion for "k" alias
complete -o default -F __start_kubectl k

# # if s2i works,
# eval "$(s2i completion bash)"

alias av="anyenv versions"
alias pv="pyenv versions"

alias grr="git remind repos"
alias gr="git remind status -a -s"
alias grn="git remind status-notification"

# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
# [ -f /Users/shinsa/git/tecj/2019/generator-test/node_modules/tabtab/.completions/yo.bash ] && . /Users/shinsa/git/tecj/2019/generator-test/node_modules/tabtab/.completions/yo.bash

# eval "$(direnv hook bash)"

# prompt settings
function parse_git_branch {
    git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \(\1\)/'
}

function set_prompt {
    local BLUE="\[\e[1;34m\]"
    local CYAN="\[\e[1;36m\]"
    local RED="\[\e[1;31m\]"
    local GREEN="\[\e[0;32m\]"
    local WHITE="\[\e[00m\]"
    local GRAY="\[\e[1;37m\]"
    export PS1="[\t ${CYAN}\w${WHITE}]${GREEN}\$(parse_git_branch)${WHITE}\n\\$ "
}

set_prompt

# fzf settings
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
