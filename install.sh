#!/bin/bash
# setup script

set -e

echo "** chainging login shell..."
chsh -s /bin/bash

echo "** setting up brew..."
bash brew-setup.sh

echo "** setting up git..."
bash git-setup.sh

echo "** setting up ssh..."
bash ssh-setup.sh

echo "** setup completed."
