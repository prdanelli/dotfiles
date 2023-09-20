#!/bin/bash

if [ -d "/Users/paul/Personal/Repos/neovim" ]
then
  echo "Found Neovim Repo"
  cd ~/Personal/Repos/neovim
  git pull
else
  echo "Could not find Neovim repo"
  cd ~/Personal/Repos
  git clone https://github.com/neovim/neovim
  cd neovim
fi

sudo make distclean
sudo make install
