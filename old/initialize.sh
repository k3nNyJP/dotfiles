#!/usr/bin/env bash
cd "$(dirname "$0")"

ln -sf $(pwd)/.bash_profile ~/.bash_profile
ln -sf $(pwd)/.bashrc ~/.bashrc

if type fish >/dev/null 2>&1; then
    ln -sf $(pwd)/config.fish ~/.config/fish/config.fish
fi
