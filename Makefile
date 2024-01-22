all: hypr waybar wofi

hypr:
	cp -r config/hypr/* ~/.config/hypr/

waybar:
	sassc config/waybar/style.scss ~/.config/waybar/style.css
	cp config/waybar/config.jsonc ~/.config/waybar/

wofi:
	sassc config/wofi/style.scss ~/.config/wofi/style.css
	cp config/wofi/config ~/.config/wofi/
