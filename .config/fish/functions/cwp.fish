# Change wallpaper
function cwp
    set wallpaper $argv[1]
    wal -i $wallpaper
    killall swaybg
    killall swaync
    hyprctl hyprpaper unload all
    hyprctl hyprpaper preload "/home/utmkn/Pictures/Wallpapers/$wallpaper"
    hyprctl hyprpaper wallpaper "HDMI-A-1, /home/utmkn/Pictures/Wallpapers/$wallpaper"
    sh ~/.config/waybar/launch.sh
    swaync &
end
