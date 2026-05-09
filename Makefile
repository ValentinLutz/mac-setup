.PHONY: help tools iterm2 zsh docker git ssh aws opencode

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "  tools      Install Homebrew packages"
	@echo "  iterm2     Configure iTerm2"
	@echo "  zsh        Install oh-my-zsh and zsh config"
	@echo "  docker     Configure Docker"
	@echo "  git        Configure Git"
	@echo "  ssh        Configure SSH"
	@echo "  aws        Configure AWS SSO"
	@echo "  opencode   Configure OpenCode"

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

aws:
	bash 07_aws/install.sh

agents:
	bash 08_agents/install.sh
