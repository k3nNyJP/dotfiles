#!/usr/bin/env bash
cd "$(dirname "$0")"

ln -sf $(pwd)/.bash_profile ~/.bash_profile
ln -sf $(pwd)/.bashrc ~/.bashrc
