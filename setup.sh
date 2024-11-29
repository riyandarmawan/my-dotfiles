#!/bin/bash

BACKUP_DIR=~/Documents/my-dotfiles

# List of folders in ~/.config to back up
CONFIG_FOLDERS=(
  "alacritty"
  "atuin"
  "bspwm"
  "dunst"
  "gtk-2.0"
  "gtk-3.0"
  "gtk-4.0"
  "lazygit"
  "neofetch"
  "nitrogen"
  "nvim"
  "polybar"
  "rofi"
  "starship"
  "sxhkd"
)

# List of applications to ensure are installed
REQUIRED_APPS=(
  "alacritty"
  "atuin"
  "bspwm"
  "dunst"
  "gtk3"
  "gtk4"
  "lazygit"
  "neofetch"
  "nitrogen"
  "neovim"
  "polybar"
  "rofi"
  "starship"
  "sxhkd"
  "zsh"
)

# Function to ensure applications are installed
ensure_installed() {
  echo "Ensuring all required applications are installed..."
  for app in "${REQUIRED_APPS[@]}"; do
    if ! command -v "$app" &>/dev/null; then
      echo "$app is not installed. Installing..."
      sudo pacman -S --needed --noconfirm "$app"
    else
      echo "$app is already installed."
    fi
  done
}

# Backup dotfiles
backup_dotfiles() {
  echo "Creating backup directory: $BACKUP_DIR"
  mkdir -p "$BACKUP_DIR/config"
  mkdir -p "$BACKUP_DIR/oh-my-zsh"
  mkdir -p "$BACKUP_DIR/zsh"

  echo "Backing up selected ~/.config folders"
  for folder in "${CONFIG_FOLDERS[@]}"; do
    if [[ -d ~/.config/$folder ]]; then
      echo "Backing up ~/.config/$folder"
      rsync -av --exclude=".git" ~/.config/"$folder" "$BACKUP_DIR/config/"
    else
      echo "Warning: ~/.config/$folder does not exist, skipping."
    fi
  done

  echo "Backing up oh-my-zsh configuration"
  if [[ -d ~/.oh-my-zsh ]]; then
    rsync -av --exclude=".git" ~/.oh-my-zsh/ "$BACKUP_DIR/oh-my-zsh/"
  else
    echo "Warning: ~/.oh-my-zsh does not exist, skipping."
  fi

  echo "Backing up .zshrc"
  if [[ -f ~/.zshrc ]]; then
    cp ~/.zshrc "$BACKUP_DIR/zsh/"
  else
    echo "Warning: ~/.zshrc does not exist, skipping."
  fi

  echo "Backup complete!"
}

# Restore dotfiles
restore_dotfiles() {
  echo "Restoring selected ~/.config folders"
  for folder in "${CONFIG_FOLDERS[@]}"; do
    if [[ -d $BACKUP_DIR/config/$folder ]]; then
      echo "Restoring ~/.config/$folder"
      rsync -av "$BACKUP_DIR/config/$folder" ~/.config/
    else
      echo "Warning: $BACKUP_DIR/config/$folder does not exist, skipping."
    fi
  done

  echo "Restoring oh-my-zsh configuration"
  if [[ -d $BACKUP_DIR/oh-my-zsh ]]; then
    rsync -av "$BACKUP_DIR/oh-my-zsh/" ~/.oh-my-zsh/
  else
    echo "Warning: $BACKUP_DIR/oh-my-zsh does not exist, skipping."
  fi

  echo "Restoring .zshrc"
  if [[ -f $BACKUP_DIR/zsh/.zshrc ]]; then
    cp "$BACKUP_DIR/zsh/.zshrc" ~/
  else
    echo "Warning: $BACKUP_DIR/zsh/.zshrc does not exist, skipping."
  fi

  echo "Restore complete!"
}

# Main script logic
if [[ $1 == "backup" ]]; then
  backup_dotfiles
elif [[ $1 == "restore" ]]; then
  ensure_installed
  restore_dotfiles
else
  echo "Usage: $0 [backup|restore]"
  exit 1
fi
