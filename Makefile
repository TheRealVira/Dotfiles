HOM = ~/
CONFIG = .config/
FIREFOX = .mozilla/firefox/*-release/

install:
	stow Dotfiles/ --target ${HOM}${CONFIG}
	stow zsh/ --target ${HOM}
	stow Firefox/ --target ${HOM}${FIREFOX}
uninstall:
	stow -D Dotfiles/ --target ${HOM}${CONFIG}
	stow -D zsh/ --target ${HOM}
	stow -D Firefox/ --target ${HOM}${FIREFOX} 
update:
	git pull
