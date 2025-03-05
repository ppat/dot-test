# Dotfiles

A Chezmoi-based dotfiles repository for managing system configuration, shell settings, and development tools.

## Components

- **Chezmoi**: Orchestrates all configuration management
- **Aqua**: Manages CLI tools (kubectl, helm, etc.)
- **Mise**: Manages language runtimes and SDKs
- **Homebrew**: Installs system packages and GUI apps on macOS

## Getting Started

1. Install Chezmoi:
   ```bash
   sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply <your-github-username>
   ```

2. Chezmoi will automatically:
   - Install core tools (Homebrew, Aqua, Mise)
   - Configure macOS defaults (on macOS)
   - Install packages and applications
   - Set up your shell environment

## Directory Structure

- `~/.local/share/chezmoi`: Chezmoi source directory
- `~/.config/aquaproj-aqua`: Aqua configuration
- `~/.config/mise`: Mise configuration
- `~/.local/bash`: Bash customizations
- `~/.local/bin`: Custom scripts

## Management Commands

- Update dotfiles: `chezmoi update`
- Add a file to management: `chezmoi add ~/.some-file`
- Edit a file: `chezmoi edit ~/.some-file`
- Apply changes: `chezmoi apply`
