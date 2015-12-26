#!/usr/bin/env zsh

SUBL="$HOME/Library/Application Support/Sublime Text 3"
USER_PACKAGE="$SUBL/Packages/User"

if [ ! -d $SUBL/Packages ]; then
    echo "No Sublime Text config directory, creating..."
    mkdir -p $SUBL/Packages
fi

# If it's not a symlink, symlink it to here.
if [ ! -h $USER_PACKAGE ]; then
    echo "Sublime User package not synced, symlinking..."
    rm -rf $USER_PACKAGE
    ln -s ~/.dotfiles/sublime-text/sync/User $USER_PACKAGE
fi
