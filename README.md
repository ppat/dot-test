# Dotfiles

A modern, lightweight, and modular dotfiles management system using Chezmoi for orchestration and best-in-class tools (aqua, mise, homebrew) for package management.

## Overview

This dotfiles repository provides a comprehensive solution for managing my development environment across multiple machines with a focus on:

- **Lightweight operation**: Everything runs on-demand, no background daemons
- **Modular design**: Clean separation of concerns with specialized tools
- **Elegant environment management**: Centralized `.env` files for all configurations
- **Cross-platform compatibility**: Works on macOS and Linux with OS-specific settings
- **Reproducibility**: Version-controlled configurations

## Core Components

### Chezmoi: The Orchestrator

[Chezmoi](https://www.chezmoi.io/) serves as the central orchestrator for the entire dotfiles ecosystem:

- Manages configuration files with templating support
- Runs scripts in a controlled, ordered manner
- Handles machine-specific differences
- Provides a consistent way to update configurations

### Tool Management

The repository integrates several specialized tools:

- **[Aqua](https://aquaproj.github.io/)**: Manages CLI binaries (kubectl, helm, etc.)
  - Speedy, lightweight, reproducible installation
  - Version-controlled binary management

- **[Mise](https://mise.jdx.dev/)**: Manages language SDKs and runtimes
  - Handles multiple versions of languages (Rust, Go, Node, Python, etc.)
  - Manages global tool installations via pipx, npm, etc.

- **[Homebrew](https://brew.sh/)**: Manages system packages and GUI apps (macOS)
  - Uses Brewfile for reproducible installations
  - Handles GUI applications via Casks

### Environment Variable Management

A clean, modular approach to environment variables:

- **`.env` files**: Standard format for environment variables
  - `.env`: Core variables for all systems
  - `.env.macos`: macOS-specific variables
  - `.env.linux`: Linux-specific variables
  - `.env.local`: Machine-specific overrides (not tracked in git)

- **Central loader**: `~/.local/bash/load_env.sh` script
  - Intelligently loads the right files
  - Handles variable expansion
  - Provides helper functions like `show_env` and `reload_env`

## Getting Started

### Initial Setup

1. Install Chezmoi and initialize with this repository:

```bash
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply username/dotfiles
```

2. Chezmoi will:
   - Install required tools (Homebrew, Aqua, Mise)
   - Set up environment files
   - Configure your shell
   - Install packages based on your OS

### Manual Installation

If you prefer to set up step-by-step:

1. Clone the repository:
```bash
git clone https://github.com/username/dotfiles.git
cd dotfiles
```

2. Install Chezmoi:
```bash
sh -c "$(curl -fsLS get.chezmoi.io)"
```

3. Initialize Chezmoi with the local repository:
```bash
chezmoi init --source=.
chezmoi apply
```

## Daily Usage

### Environment Management

- View environment variables: `show_env`
- Reload environment: `reload_env`
- Edit environment variables:
  - System-wide: `chezmoi edit ~/.config/env/.env`
  - OS-specific: `chezmoi edit ~/.config/env/.env.macos`
  - Machine-specific: `$EDITOR ~/.config/env/.env.local`

### Package Management

- Install or update Aqua tools:
```bash
aqua install
```

- Install or update language runtimes:
```bash
mise install
```

- Install or update Homebrew packages (macOS):
```bash
brew bundle --file=~/Brewfile
```

### Updating Configuration

Update your dotfiles from the git repository:

```bash
chezmoi update
```

Add a new file to Chezmoi management:

```bash
chezmoi add ~/.some-config-file
```

## Customization

### Machine-Specific Configuration

1. Edit your local environment variables:
```bash
$EDITOR ~/.config/env/.env.local
```

2. Create template variations in Chezmoi:
```bash
# Example .bashrc with hostname condition
{{ if eq .chezmoi.hostname "work-laptop" }}
# Work-specific bash settings
{{ else }}
# Personal bash settings
{{ end }}
```

### Adding New Tools

1. **Aqua tools**: Edit `~/.config/aquaproj-aqua/aqua.yaml`
2. **Mise languages**: Edit `~/.config/mise/config.toml`
3. **Homebrew packages**: Edit `~/Brewfile`
4. **Environment variables**: Add to the appropriate `.env` file

## OS-Specific Features

### macOS

- Default macOS system preferences via `defaults` command
- Homebrew package and Cask installation
- macOS-specific environment variables

### Linux

- Distribution detection and appropriate package installation
- Linux-specific environment variables and paths

## Mise Tasks

The repository includes a variety of Mise tasks to simplify common operations:

- `mise run init:dirs` - Create necessary directories
- `mise run init:dotfiles` - Update dotfiles 
- `mise run setup:darwin` - macOS-specific setup
- `mise run show:env` - Display environment information

## Extending

To extend this dotfiles repository:

1. Add new configuration files using `chezmoi add`
2. Create new run scripts in the `run_scripts/` directory
3. Add new environment variables to the appropriate `.env` file
4. Commit your changes and push to git
