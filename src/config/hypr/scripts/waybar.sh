#/bin/bash

trap "killall waybar" EXIT

CFG_FILE="$HOME/.config/waybar/config.jsonc"
CSS_FILE="$HOME/.config/waybar/style.css"

while true; do
    echo "$0: Starting waybar in the background..."
    waybar &
    echo "$0: Started waybar PID=$!. Waiting for file changes..."
    inotifywait -e modify ${CFG_FILE} ${CSS_FILE}
    echo "$0: inotifywait returned $?. Killing all waybar processes..."
    killall waybar
    echo "$0: killall waybar returned $?, wait a sec..."
    sleep 1
done