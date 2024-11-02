#!/bin/bash

# Store the current directory
original_dir=$(pwd)

# Change to .dotfiles directory
cd ~/.dotfiles || exit 1

# Define functions for stow actions
stow_init() {
  for dir in config oh-my-zsh tmux zsh; do
    sudo stow "$dir"
  done
}

stow_refresh() {
  for dir in config oh-my-zsh tmux zsh; do
    sudo stow -R "$dir"
  done
}

stow_delete() {
  for dir in config oh-my-zsh tmux zsh; do
    sudo stow -D "$dir"
  done
}

# Check the input argument and run the corresponding function
case "$1" in
init)
  stow_init
  ;;
refresh)
  stow_refresh
  ;;
delete)
  stow_delete
  ;;
*)
  echo "Usage: $0 {init|refresh|delete}"
  ;;
esac

# Return to the original directory
cd "$original_dir"
