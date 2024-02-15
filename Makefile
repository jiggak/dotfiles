all: hypr waybar waymenu

hypr:
	cp -r config/hypr/* ~/.config/hypr/

waybar:
	sassc config/waybar/style.scss ~/.config/waybar/style.css
	cp config/waybar/config.jsonc ~/.config/waybar/

waymenu:
	sassc config/waymenu/style.scss ~/.config/waymenu/style.css
	cp -r config/waymenu/power ~/.config/waymenu

watch:
	@while true; do \
		inotifywait -qre close_write config; \
		$(MAKE) all; \
	done
