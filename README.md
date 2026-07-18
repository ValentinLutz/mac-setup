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
| **07_aws** | AWS CLI SSO profile configuration |
| **08_agents** | Deploys the shared agent instruction file and skills to Claude Code, Codex, opencode, and pi |

## Pre-requisites

1. **Homebrew** - Required for installing packages
   - Install from [brew.sh](https://brew.sh/)
   - Or run: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

2. **Xcode Command Line Tools** - Required by Homebrew
   - Install via: `xcode-select --install`

## Installation

### Option 1: Install All Modules

Run each module target in the recommended order:

```bash
make tools
make iterm2
make zsh
make docker
make git
make ssh
make aws
make agents
```

### Option 2: Install Specific Module

Run the matching target (see `make help` for the full list):

```bash
make zsh
```

## Module Details

### 01_tools
Installs core development tools via Homebrew based on the `brewfile` manifest.

**What it installs:** Check `01_tools/brewfile` for the complete list of packages.

Language runtimes and build tools are installed globally through mise. This includes Go, Rust, Python, Node.js LTS, Bun, Java, Maven, and Gradle.

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
Installs the Docker CLI, Podman, Podman Desktop, and supporting container tools. The installer backs up any existing `~/.docker/config.json` and replaces it with `docker.config.json`, which stores registry credentials in the macOS Keychain via `docker-credential-osxkeychain` and adds the Homebrew CLI plugin directory. Run `docker login <registry>` again after installation to move credentials into the Keychain.

**Configuration file:** `docker.config.json`

Podman requires a Linux virtual machine on macOS. Initialize and start the default machine once after installation:

```bash
podman machine init --now
podman info
```

For later sessions, start an existing stopped machine with `podman machine start`.

### 05_git
Configures Git with custom global settings and local repository hooks.

**What it does:**
- Backs up existing `~/.gitconfig` and `~/.gitconfigs/`
- Installs global Git configuration
- Installs Git hooks (including pre-commit message hooks)
- Commit hook file: `05_git/.gitconfigs/default/hooks/commit-msg`
- Applies directory-based identity: repos under `~/Projects/monkescience/` and `~/Projects/valentinlutz/` get their own `user` config, everything else under `~/Projects/` uses the default. Core settings and hooks are shared from the default config

### 06_ssh
Provides instructions for SSH key setup and configuration.

**Steps:**
1. Create SSH keys (see `06_ssh/README.md`)
2. Add keys to GitHub, servers, etc.
3. Run `install.sh` to configure SSH client settings

The installed SSH configuration scopes the GitHub key to `github.com`, adds it to the SSH agent, and stores its passphrase in the macOS Keychain.

### 07_aws
Configures AWS CLI SSO profiles for the dev, prod, and root accounts.

**What it does:**
- Backs up existing `~/.aws/config`
- Installs AWS SSO config for explicit dev, prod, and root profiles
- Enables `aws sso login --profile dev`, `aws sso login --profile prod`, and `aws sso login --profile root`

### 08_agents
Deploys a single shared agent instruction file and common skills to multiple coding agents.

**What it does:**
- Copies `AGENTS.md` verbatim to Claude Code, Codex, opencode, and pi
- Honors `CLAUDE_CONFIG_DIR`, `CODEX_HOME`, `XDG_CONFIG_HOME`, and `PI_CODING_AGENT_DIR`, with each agent's standard user directory as the fallback
- Installs Claude Code `settings.json` and opencode `opencode.json`
- Installs shared skills globally. Codex discovers their shared copies in `~/.agents/skills`

## Backups

Installation scripts create timestamped backups before overwriting existing configuration files. Backups are stored in a `backups/` folder next to each install script, for example `03_zsh/backups/<timestamp>/`. These folders are gitignored, so backups stay local and are never committed.

## Customization

Each module contains configuration files that you can customize before installation:

- `01_tools/brewfile` - List of Homebrew packages
- `02_iterm2/com.googlecode.iterm2.plist` - iTerm2 preferences
- `03_zsh/.zshrc` - Zsh shell configuration
- `04_docker/docker.config.json` - Base Docker CLI configuration
- `05_git/.gitconfig` - Git global configuration and per-directory identity rules
- `05_git/.gitconfigs/default/` - Default identity, Git hooks, and shared core settings
- `05_git/.gitconfigs/monkescience/` and `05_git/.gitconfigs/valentinlutz/` - Per-directory identity overrides for repos under `~/Projects/monkescience/` and `~/Projects/valentinlutz/`
- `06_ssh/config` - SSH client configuration
- `07_aws/config` - AWS CLI SSO profile configuration
- `08_agents/AGENTS.md` - Shared agent instructions deployed to Claude Code, Codex, opencode, and pi

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
