#!/usr/bin/env bash

# brightnessctl info
MAX=4438

# iDIR="$HOME/.config/mako/icons"
ICON_20=/usr/share/icons/Pop/scalable/status/display-brightness-low-symbolic.svg
ICON_40=/usr/share/icons/Pop/scalable/status/display-brightness-low-symbolic.svg
ICON_60=/usr/share/icons/Pop/scalable/status/display-brightness-medium-symbolic.svg
ICON_80=/usr/share/icons/Pop/scalable/status/display-brightness-medium-symbolic.svg
ICON_100=/usr/share/icons/Pop/scalable/status/display-brightness-high-symbolic.svg

# Get brightness
get_backlight() {
    # LIGHT=$(printf "%.0f\n" $(( $(brightnessctl g))
    brightness=$(brightnessctl g)
    LIGHT=$(( $brightness * 100 / $MAX ))
    echo $LIGHT
}

# Get icons
get_icon() {
    current="$(get_backlight)"
    if [[ ("$current" -ge "0") && ("$current" -le "20") ]]; then
        # icon="$iDIR/brightness-20.png"
        icon="$ICON_20"
    elif [[ ("$current" -ge "20") && ("$current" -le "40") ]]; then
        # icon="$iDIR/brightness-40.png"
        icon="$ICON_40"
    elif [[ ("$current" -ge "40") && ("$current" -le "60") ]]; then
        # icon="$iDIR/brightness-60.png"
        icon="$ICON_60"
    elif [[ ("$current" -ge "60") && ("$current" -le "80") ]]; then
        # icon="$iDIR/brightness-80.png"
        icon="$ICON_80"
    elif [[ ("$current" -ge "80") && ("$current" -le "100") ]]; then
        # icon="$iDIR/brightness-100.png"
        icon="$ICON_100"
    fi
}

# Notify
notify_user() {
    notify-send -h string:x-canonical-private-synchronous:sys-notify \
        -c center -u low -i "$icon" \
        "Brightness $(get_backlight)%"
}

# Increase brightness
inc_backlight() {
    brightnessctl s +5% && get_icon && notify_user
}

# Decrease brightness
dec_backlight() {
    brightnessctl s 5%- && get_icon && notify_user
}

# Execute accordingly
if [[ "$1" == "--get" ]]; then
    get_backlight
elif [[ "$1" == "--inc" ]]; then
    inc_backlight
elif [[ "$1" == "--dec" ]]; then
    dec_backlight
else
    get_backlight
fi