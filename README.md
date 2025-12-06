# mac-setup

Automated macOS development environment setup and configuration. This repository provides installation and configuration scripts for essential development tools and shell environments.

## Overview

This project is organized into modular configuration sections, each handling a specific tool or environment. You can run all modules or selectively install specific ones.

### Modules

| Module | Purpose |
|--------|---------|
| **01_tools** | Installs essential development tools via Homebrew |
| **02_iterm2** | Configures iTerm2 terminal emulator with custom settings |
| **03_zsh** | Sets up Zsh shell with oh-my-zsh framework and custom configuration |
| **04_docker** | Installs and configures Docker for containerization |
| **05_git** | Configures Git with custom settings and commit hooks |
| **06_ssh** | SSH key setup and configuration for secure connections |

## Pre-requisites

1. **Homebrew** - Required for installing packages
   - Install from [brew.sh](https://brew.sh/)
   - Or run: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

2. **Xcode Command Line Tools** - Required by Homebrew
   - Install via: `xcode-select --install`

## Installation

### Option 1: Install All Modules

Each module must be installed individually in the recommended order:

```bash
cd 01_tools && bash install.sh && cd ..
cd 02_iterm2 && bash install.sh && cd ..
cd 03_zsh && bash install.sh && cd ..
cd 04_docker && bash install.sh && cd ..
cd 05_git && bash install.sh && cd ..
cd 06_ssh && bash install.sh && cd ..
```

### Option 2: Install Specific Module

Navigate to the desired module and run its install script:

```bash
cd 03_zsh && bash install.sh
```

## Module Details

### 01_tools
Installs core development tools via Homebrew based on the `brewfile` manifest.

**What it installs:** Check `01_tools/brewfile` for the complete list of packages.

### 02_iterm2
Configures iTerm2 terminal with the provided preferences profile (`com.googlecode.iterm2.plist`).

**Note:** Existing iTerm2 settings will be preserved before applying new configuration.

### 03_zsh
Installs oh-my-zsh and applies custom Zsh configuration.

**What it does:**
- Installs oh-my-zsh framework
- Backs up existing `~/.zshrc` with timestamp
- Replaces with custom `.zshrc` configuration
- Provides instructions to reload configuration

### 04_docker
Installs Docker and applies custom Docker daemon configuration.

**Configuration file:** `docker.config.json`

### 05_git
Configures Git with custom global settings and local repository hooks.

**What it does:**
- Backs up existing `~/.gitconfig` and `~/.gitconfigs/`
- Installs global Git configuration
- Installs Git hooks (including pre-commit message hooks)
- Commit hook file: `05_git/.gitconfigs/default/hooks/commit-msg`

### 06_ssh
Provides instructions for SSH key setup and configuration.

**Steps:**
1. Create SSH keys (see `06_ssh/README.md`)
2. Add keys to GitHub, servers, etc.
3. Run `install.sh` to configure SSH client settings

## Backups

All installation scripts automatically create timestamped backups before overwriting configuration files:

- `YYYYMMDD_HHMMSS.zshrc.backup`
- `YYYYMMDD_HHMMSS.gitconfig.backup`
- `YYYYMMDD_HHMMSS.gitconfigs.backup/`

These backups are created in the respective module directories and can be safely deleted once you confirm the new configuration works correctly.

## Customization

Each module contains configuration files that you can customize before installation:

- `01_tools/brewfile` - List of Homebrew packages
- `02_iterm2/com.googlecode.iterm2.plist` - iTerm2 preferences
- `03_zsh/.zshrc` - Zsh shell configuration
- `04_docker/docker.config.json` - Docker daemon config
- `05_git/.gitconfig` - Git global configuration
- `05_git/.gitconfigs/default/` - Git hooks and local configs
- `06_ssh/config` - SSH client configuration

## Troubleshooting

### Homebrew Installation Fails
- Ensure Xcode Command Line Tools are installed: `xcode-select --install`
- Check internet connection
- Run `brew doctor` to diagnose issues

### Zsh Configuration Doesn't Load
- Manually reload: `source ~/.zshrc`
- Check that oh-my-zsh installed correctly: `ls ~/.oh-my-zsh`

### Git Hooks Not Working
- Ensure hooks are executable: `chmod +x ~/.gitconfigs/default/hooks/*`
- Check Git configuration: `git config --list`
