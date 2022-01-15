echo "loading .bashrc..."

# tabtab source for yo package
# uninstall by removing these lines or running `tabtab uninstall yo`
[ -f /Users/shinsa/git/tecj/2019/generator-test/node_modules/tabtab/.completions/yo.bash ] && . /Users/shinsa/git/tecj/2019/generator-test/node_modules/tabtab/.completions/yo.bash

eval "$(direnv hook bash)"

