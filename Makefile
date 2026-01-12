.PHONY: help tools iterm2 zsh docker git ssh agents

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
	@echo "  agents   Install Claude agent instructions"

tools:
	cd 01_tools && bash install.sh

iterm2:
	cd 02_iterm2 && bash install.sh

zsh:
	cd 03_zsh && bash install.sh

docker:
	cd 04_docker && bash install.sh

git:
	cd 05_git && bash install.sh

ssh:
	cd 06_ssh && bash install.sh

agents:
	cd 08_agents && bash install.sh
