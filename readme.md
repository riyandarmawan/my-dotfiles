# My Dotfiles

This repository contains my personal configuration files (dotfiles) for Linux, along with scripts to back up, restore, and ensure all necessary applications are installed.

## Features
- **Selective Backup**: Only backs up the specified configuration folders and files.
- **Restore Functionality**: Restores your dotfiles to their original locations.
- **Application Installation**: Ensures all required applications are installed using `pacman` (or a specified package manager).
- **Easily Customizable**: Adjust the script to include new configuration files or additional applications.

---

## Folder Structure

```plaintext
my-dotfiles/
├── config/               # Backup of selected ~/.config folders
├── oh-my-zsh/            # Backup of oh-my-zsh configuration
├── zsh/                  # Backup of .zshrc and related files
├── setup.sh   # Script for backup and restore
└── README.md             # Documentation for this repository

---

## Requirements
- Linux system (preferably Arch-based for `pacman`).
- Access to a terminal with administrative privileges.
- `rsync` and `zsh` installed.

---

## Setup Instructions

1. Clone this repository:
   ```bash
   git clone https://github.com/riyandarmawan/my-dotfiles.git
   cd my-dotfiles


