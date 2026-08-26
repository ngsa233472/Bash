#!/bin/bash
cp ./.bashrc ~/
cp ./.bash_aliases ~/
cp ./.bash_functions ~/
cp ./.bash_logout ~/
cp ./.bash_profile ~/
cp ./.gitconfig ~/


#!/usr/bin/env bash

set -euo pipefail

BACKUP_DIR="/install_data/Saved/$USER/bash/bash-$(date +%Y%m%d-%H%M%S)"

mkdir -p "$BACKUP_DIR"

for file in \
    .bashrc \
    .bash_aliases \
    .bash_functions \
    .bash_logout \
    .bash_profile \
    .gitconfig
do
    if [ -f "$HOME/$file" ]; then
        cp -a "$HOME/$file" "$BACKUP_DIR/"
    fi

    cp -a "./$file" "$HOME/$file"
done

echo "Configuration installed."
echo "Previous files backed up to:"
echo "$BACKUP_DIR"
