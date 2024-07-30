# Change wallpaper
function cwp
    set wallpaper $argv[1]
    wal -i $wallpaper
    killall swaybg
    hyprctl hyprpaper wallpaper "HDMI-A-1, /home/utmkn/Pictures/Wallpapers/$wallpaper"
end
