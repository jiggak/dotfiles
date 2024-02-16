all: base waybar waymenu

base:
	-cp src/* ~/
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
