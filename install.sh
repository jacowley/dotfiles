#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.config
ln -s $DIR/nvim ~/.config/nvim
ln -s $DIR/tmux.conf ~/.tmux.conf
ln -s $DIR/tmux ~/.tmux
ln -s $DIR/editorconfig ~/.editorconfig

