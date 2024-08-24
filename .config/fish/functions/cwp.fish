# Change wallpaper
function cwp
    set wallpaper $argv[1]
    wal -i $wallpaper > /dev/null 2>&1
    killall swaybg > /dev/null 2>&1
    killall swaync > /dev/null 2>&1
    hyprctl hyprpaper unload all > /dev/null 2>&1
    hyprctl hyprpaper preload "/home/utmkn/Pictures/Wallpapers/$wallpaper" > /dev/null 2>&1
    hyprctl hyprpaper wallpaper "HDMI-A-1, /home/utmkn/Pictures/Wallpapers/$wallpaper" > /dev/null 2>&1
    sh ~/.config/waybar/launch.sh > /dev/null 2>&1
    swaync > /dev/null 2>&1 &
end
