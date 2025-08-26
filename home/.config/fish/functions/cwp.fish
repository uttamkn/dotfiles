# Change wallpaper
function cwp
    set wallpaper $argv[1]
    # Check if a second argument (color scheme image) is provided
    if set -q argv[2]
        set color_scheme $argv[2]
        wal -i "$color_scheme" -n > /dev/null 2>&1
    else
        wal -i "$wallpaper" -n > /dev/null 2>&1
    end

    echo "\$swaywall = /home/utmkn/Pictures/Wallpapers/$wallpaper" >> ~/.cache/wallpaper.conf
    killall swaybg > /dev/null 2>&1
    killall swaync > /dev/null 2>&1
    swaybg -i "/home/utmkn/Pictures/Wallpapers/$wallpaper" > /dev/null 2>&1 &
    disown
    sh ~/.config/waybar/launch.sh > /dev/null 2>&1
    swaync > /dev/null 2>&1 &
    disown
end
