#!/bin/bash
# git setup
git config --global user.name "Shin Saito"
git config --global user.email shinsa@jp.ibm.com

git config --global alias.s "status -sb --ignored"
git config --global alias.c commit
git config --global alias.p push
git config --global alias.b "branch -a"
git config --global alias.co "checkout"
git config --global alias.f "fetch -p"
git config --global alias.r "rebase origin/master"
git config --global alias.d diff
git config --global alias.l "log --graph"
git config --global push.default current
git config --global pull.rebase true
git config --global init.defaultbranch main # default is still "master", as of Jan. 2022.
# git config --global url.git@github.ibm.com:.insteadof=https://github.ibm.com/

# setting for git remind
git config --global remind.paths "${HOME}/dotfiles,${HOME}/git/*"

echo "** setting crontab to invoke git-remind..."
echo "0 11,17,23 * * * /usr/local/bin/git-remind status-notification >/dev/null 2>&1" | crontab
