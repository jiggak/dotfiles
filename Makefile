all: base waybar waymenu

base:
	# copy regular dotfiles (not recursive) from src/* to $HOME
	-cp src/* ~/
	# copy vim config dir
	cp -r src/.vim ~/
	# copy config/* recursively to $HOME/.config (ignore .scss)
	cd src/config && find . -type f -not -iname '*.scss' -exec cp -p --parents '{}' ~/.config \;

waybar:
	sassc src/config/waybar/style.scss ~/.config/waybar/style.css

waymenu:
	sassc src/config/waymenu/style.scss ~/.config/waymenu/style.css

watch:
	@while true; do \
		inotifywait -qre close_write src; \
		$(MAKE) all; \
	done
