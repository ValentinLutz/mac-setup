.PHONY: help tools iterm2 zsh docker git ssh prompts claude claude-uninstall

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "  tools    Install Homebrew packages"
	@echo "  iterm2   Configure iTerm2"
	@echo "  zsh      Install oh-my-zsh and zsh config"
	@echo "  docker   Configure Docker"
	@echo "  git      Configure Git"
	@echo "  ssh      Configure SSH"
	@echo "  prompts  Install LLM prompts and skills"
	@echo "  claude   Install Claude Code plugins"
	@echo "  claude-uninstall  Uninstall Claude Code plugins"

tools:
	bash 01_tools/install.sh

iterm2:
	bash 02_iterm2/install.sh

zsh:
	bash 03_zsh/install.sh

docker:
	bash 04_docker/install.sh

git:
	bash 05_git/install.sh

ssh:
	bash 06_ssh/install.sh

prompts:
	bash 08_prompts/install.sh

claude:
	bash 09_claude/install.sh

claude-uninstall:
	bash 09_claude/uninstall.sh
