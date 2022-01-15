#!/bin/bash
sudo bash -c 'echo "/usr/local/bin/bash" >> /etc/shells'
echo "** new version of bash has been added to /etc/shells."
cat /etc/shells

echo "** chainging login shell..."
chsh -s /usr/local/bin/bash

echo "** cloning dircolors-solarized..."
(cd ${HOME}/.local; git clone https://github.com/seebi/dircolors-solarized.git)

# copy init files
cp .bash_profile .bashrc ${HOME}

# fzf settings
bash /usr/local/opt/fzf/install 

echo "** done."
