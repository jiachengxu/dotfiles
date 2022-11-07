#!/bin/bash

if [[ ! -L ~/.config/nvim/lua/custom ]]; then
  ln -s ~/projects/personal/dotfiles/nvim ~/.config/nvim/lua/custom
fi
