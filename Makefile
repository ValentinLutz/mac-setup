.PHONY: help tools ghostty zsh docker git ssh aws agents

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "Targets:"
	@echo "  tools      Install Homebrew packages"
	@echo "  ghostty    Configure Ghostty"
	@echo "  zsh        Install oh-my-zsh and zsh config"
	@echo "  docker     Configure Docker"
	@echo "  git        Configure Git"
	@echo "  ssh        Configure SSH"
	@echo "  aws        Configure AWS SSO"
	@echo "  agents     Install shared agent config and skills"

tools:
	bash 01_tools/install.sh

ghostty:
	bash 02_ghostty/install.sh

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
