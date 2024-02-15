swayidle -w timeout 300 'swaylock -f -e' \
            timeout 600 'systemctl suspend' \
            before-sleep 'swaylock -f -e' &