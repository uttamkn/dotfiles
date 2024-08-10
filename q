[1mdiff --git a/.config/hypr/hyprkeys.conf b/.config/hypr/hyprkeys.conf[m
[1mindex 46044cd..0396a65 100644[m
[1m--- a/.config/hypr/hyprkeys.conf[m
[1m+++ b/.config/hypr/hyprkeys.conf[m
[36m@@ -1,14 +1,10 @@[m
[32m+[m[32m# Shortcuts[m
 bind = $mainMod, RETURN, exec, $terminal[m
 bind = $mainMod, Q, exec, $browser[m
[31m-bind = $mainMod, F, fullscreen,[m
[31m-bind = $mainMod, C, killactive,[m
[31m-bind = $mainMod, M, exit,[m
[31m-bind = $mainMod, E, exec, $fileManager[m
[31m-bind = $mainMod, I, togglefloating,[m
 bind = $mainMod, SPACE, exec, $menu[m
[31m-bind = $mainMod, U, pseudo, # dwindle[m
[31m-bind = alt,Tab,cyclenext,          [m
[31m-bind = alt,Tab,bringactivetotop,[m
[32m+[m[32mbind = $mainMod, E, exec, $fileManager[m
[32m+[m[32mbind = $mainMod, W, exec, $terminal -e $editor[m
[32m+[m[32mbind = $mainMod, S, exec, $musicPlayer[m
 [m
 # Terminal[m
 bind = alt, E, exec, kitty -e ranger[m
[36m@@ -31,7 +27,16 @@[m [mbind = $mainMod, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-cop[m
 # Reload hypr config[m
 bind = $mainMod SHIFT, R, exec, hyprctl reload[m
 [m
[31m-# Move focus with mainMod + hjkl keys[m
[32m+[m[32m# Window[m
[32m+[m[32mbind = $mainMod, F, fullscreen,[m
[32m+[m[32mbind = $mainMod, C, killactive,[m
[32m+[m[32mbind = $mainMod, M, exit,[m
[32m+[m[32mbind = $mainMod, I, togglefloating,[m
[32m+[m[32mbind = $mainMod, U, pseudo, # dwindle[m
[32m+[m[32mbind = alt,Tab,cyclenext,[m[41m          [m
[32m+[m[32mbind = alt,Tab,bringactivetotop,[m
[32m+[m
[32m+[m[32m# Move window focus with mainMod + hjkl keys[m
 bind = $mainMod, H, movefocus, l[m
 bind = $mainMod, L, movefocus, r[m
 bind = $mainMod, K, movefocus, u[m
[36m@@ -43,6 +48,17 @@[m [mbind = $mainMod SHIFT, L, movewindow, r[m
 bind = $mainMod SHIFT, K, movewindow, u[m
 bind = $mainMod SHIFT, J, movewindow, d[m
 [m
[32m+[m[32m# Move/resize windows with mainMod + LMB/RMB and dragging[m
[32m+[m[32mbindm = $mainMod, mouse:272, movewindow[m
[32m+[m[32mbindm = $mainMod, mouse:273, resizewindow[m
[32m+[m
[32m+[m[32m# Minimize window[m
[32m+[m[32mbind = $mainMod, N, togglespecialworkspace, magic[m
[32m+[m[32mbind = $mainMod, N, movetoworkspace, +0[m
[32m+[m[32mbind = $mainMod, N, togglespecialworkspace, magic[m
[32m+[m[32mbind = $mainMod, N, movetoworkspace, special:magic[m
[32m+[m[32mbind = $mainMod, N, togglespecialworkspace, magic[m
[32m+[m
 # Switch workspaces with mainMod + [0-9][m
 bind = $mainMod, 1, workspace, 1[m
 bind = $mainMod, 2, workspace, 2[m
[36m@@ -72,14 +88,4 @@[m [mbind = $mainMod SHIFT, 8, movetoworkspace, 8[m
 bind = $mainMod SHIFT, 9, movetoworkspace, 9[m
 bind = $mainMod SHIFT, 0, movetoworkspace, 10[m
 [m
[31m-# Move/resize windows with mainMod + LMB/RMB and dragging[m
[31m-bindm = $mainMod, mouse:272, movewindow[m
[31m-bindm = $mainMod, mouse:273, resizewindow[m
[31m-[m
[31m-# Minimize window[m
[31m-bind = $mainMod, N, togglespecialworkspace, magic[m
[31m-bind = $mainMod, N, movetoworkspace, +0[m
[31m-bind = $mainMod, N, togglespecialworkspace, magic[m
[31m-bind = $mainMod, N, movetoworkspace, special:magic[m
[31m-bind = $mainMod, N, togglespecialworkspace, magic[m
 [m
[1mdiff --git a/.config/hypr/hyprvars.conf b/.config/hypr/hyprvars.conf[m
[1mindex 85a43d9..4470f27 100644[m
[1m--- a/.config/hypr/hyprvars.conf[m
[1m+++ b/.config/hypr/hyprvars.conf[m
[36m@@ -4,4 +4,5 @@[m [m$browser = firefox[m
 $editor = nvim[m
 $menu = rofi -show drun[m
 $mainMod = SUPER [m
[32m+[m[32m$musicPlayer = spotify-launcher[m
 $HOME = /home/utmkn/[m
