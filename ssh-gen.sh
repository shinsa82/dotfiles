#!/bin/bash
BOX_DIR="${HOME}/Box Sync"
SSH_DIR="${HOME}/.ssh"
OUT_FILE="${BOX_DIR}/sshfiles.tar.xz"

if [[ ! -d ${BOX_DIR} ]]; then
    echo "no Box Sync folder. aborted."
    exit 1
fi

if [[ ! -d ${SSH_DIR} ]]; then
    echo "no .ssh folder. aborted."
    exit 2
fi

echo "** archiving ssh related files..."
tar -avcf "${OUT_FILE}" -C "${HOME}" .ssh
echo "** written to ${OUT_FILE}"
echo "** done."
