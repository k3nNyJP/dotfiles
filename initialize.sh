#!/bin/bash
cd "$(dirname "$0")"

# instal homebrew
if ! type brew &> /dev/null ; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Since Homebrew is already installed, skip this phase and proceed."
fi
brew bundle install --file=Brewfile

# copy shell config
ln -sf $(pwd)/.zshrc ~/.zshrc
