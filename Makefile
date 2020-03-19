install:
	stow . --target "$${HOME}/.config/"

uninstall:
	stow -D . --target "$${HOME}/.config/"

update:
	git pull
