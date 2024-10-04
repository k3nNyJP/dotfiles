#!/bin/bash
cd "$(dirname "$0")"

# copy shell config
ln -sf $(pwd)/.zshrc ~/.zshrc

# copy git config
ln -sf $(pwd)/.user_gitconfig ~/.gitconfig

# copy npm config (This file includes credential which needs to be written by hand)
cp $(pwd)/.npmrc ~/.npmrc
