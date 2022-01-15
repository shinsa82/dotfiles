#!/bin/bash
# Installation of ssh keys and configs
# The program uses sshfiles.tar.xz on the Box folder.
BOX_FOLDER=$(defaults read com.box.desktop preferences/sync_directory_path)
SSH_FILE="${BOX_FOLDER}/sshfiles.tar.xz"

if [[ ! -f ${SSH_FILE} ]]; then
    echo "ssh keys file ${SSH_FILE} not found. aborted."
    exit 1
fi

echo "** extracting ssh keys file..."
tar -xvf "${SSH_FILE}" -C "${HOME}"
echo "** setup completed."
