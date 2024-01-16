{ pkgs, ... }:

{
    home.packages = with pkgs; [ 
      waybar
      swaylock
      hyprpaper
      wl-clipboard
      cliphist
      xfce.thunar
      swaynotificationcenter
      fuzzel
      wlogout
      neovide
    ];

    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = true;
        settings = {
            exec-once = [
                "hyprpaper"
                "~/.config/waybar/launch.sh"
                "wl-paste --type text --watch cliphist store "
                "wl-paste --type image --watch cliphist store"
                "/usr/lib/xfce-polkit/xfce-polkit "
                "swayosd-server"
                "swaync"
                "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
            ];

            "$terminal" = "alacritty";
            "$fileManager" = "thunar";
            "$menu" = "fuzzel";
            
            xwayland = {
                force_zero_scaling = true;
            };

            env = [
                "GDK_SCALE,1"
                "XCURSOR_SIZE,32"

            # Some default env vars.
                "SSH_AUTH_SOCK,$XDG_RUNTIME_DIR/ssh-agent.socket"

            # ----- NVIDIA ----- #

               #"WLR_DRM_DEVICES,/dev/dri/card1"
            #   "__NV_PRIME_RENDER_OFFLOAD,1"
                "DRI_PRIME,pci-0000_01_00_0"
  
                "__VK_LAYER_NV_optimus,NVIDIA_only"
                "__GLX_VENDOR_LIBRARY_NAME,nvidia"
                "GBM_BACKEND,nvidia-drm"
                "LIBVA_DRIVER_NAME,nvidia"
                "WLR_NO_HARDWARE_CURSORS,1"
                "__GL_GSYNC_ALLOWED,1"
                "__GL_VRR_ALLOWED,1"
                "WRL_DRM_NO_ATOMIC,1"
                "__VK_LAYER_NV_optimus,NVIDIA_only"
                "NVD_BACKEND,direct"
            #   "WLR_RENDERER_ALLOW_SOFTWARE,1"
                "EGL_PLATFORM,wayland"

                "GTK_THEME,Adwaita:dark"
                "QT_QPA_PLATFORMTHEME,wayland"
                "SDL_VIDEODRIVER,wayland"
                "QT_AUTO_SCREEN_SCALE_FACTOR,1"
                "XDG_SESSION_TYPE,wayland"
                "QT_QPA_PLATFORM,wayland"

                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
                "EDITOR,nvim"
                "SYSTEMD_EDITOR,nvim"
            ];

            input = {
                kb_layout = "fr";
                follow_mouse = 1;

                touchpad = {
                    natural_scroll = "yes";
                };

                sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
            };

            general = {
                # See https://wiki.hyprland.org/Configuring/Variables/ for more

                gaps_in = 5;
                gaps_out = 10;
                border_size = 1;
                "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                "col.inactive_border" = "rgba(595959aa)";

                layout = "dwindle";

                # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
                allow_tearing = false;
            };

            decoration = {
                # See https://wiki.hyprland.org/Configuring/Variables/ for more

                rounding = 5;
                
                blur = {
                    enabled = true;
                    size = 3;
                    passes = 1;
                };

                drop_shadow = "yes";
                shadow_range = 4;
                shadow_render_power = 3;
                "col.shadow" = "rgba(1a1a1aee)";
            };

            animations = {
                enabled = "yes";

                # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

                bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";

                animation = [
                    "windows, 1, 7, myBezier"
                    "windowsOut, 1, 7, default, popin 80%"
                    "border, 1, 10, default"
                    "borderangle, 1, 8, default"
                    "fade, 1, 7, default"
                    "workspaces, 1, 6, default"
                ];
            };

            dwindle = {
                # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
                pseudotile = "yes"; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                preserve_split = "yes"; # you probably want this
            };

            master = {
                # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
                new_is_master = true;
            };

            gestures = {
                # See https://wiki.hyprland.org/Configuring/Variables/ for more
                workspace_swipe = "off";
            };

            misc = {
                # See https://wiki.hyprland.org/Configuring/Variables/ for more
                force_default_wallpaper = 0; # Set to 0 to disable the anime mascot wallpapers
            };

            # Example per-device config
            # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
            "device:epic-mouse-v1" = {
                sensitivity = -0.5;
            };

            # Example windowrule v1
            # windowrule = float, ^(kitty)$
            # Example windowrule v2specified
            # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
            # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
            windowrulev2 = [
                "nomaximizerequest, class:.*" # You'll probably like this.
                "float, class:floating"
                "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
                "noanim,class:^(xwaylandvideobridge)$"
                "nofocus,class:^(xwaylandvideobridge)$"
                "noinitialfocus,class:^(xwaylandvideobridge)$"
            ];

            windowrule = [ 
                "float,polkit-gnome-authentication-agent-1"
                "float,xfce-polkit"
            ];
            

            # See https://wiki.hyprland.org/Configuring/Keywords/ for more
            "$mainMod" = "SUPER";

            # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
            bind = [
                "$mainMod, code:49, focuswindow, neovide"
                "$mainMod SHIFT, code:49, exec, neovide"
                "$mainMod, code:10, focuswindow, Alacritty"
                "$mainMod SHIFT, code:10, exec, $terminal"
                "$mainMod, code:11, focuswindow, firefox"
                "$mainMod SHIFT, code:11, exec, firefox"
                "$mainMod, code:12, focuswindow, chromium"
                "$mainMod SHIFT, code:12, exec, chromium"
                "$mainMod, C, killactive, "
                "$mainMod, M, exit, "
                "$mainMod, E, exec, $fileManager"
                "$mainMod, V, togglefloating, "
                "$mainMod, P, exec, $menu"
                #"$mainMod, P, pseudo, # dwindle"
                "$mainMod, S, togglesplit, # dwindle"

            # Move focus with mainMod + arrow keys
                "$mainMod, h, movefocus, l"
                "$mainMod, l, movefocus, r"
                "$mainMod, k, movefocus, u"
                "$mainMod, j, movefocus, d"

            # Switch workspaces with mainMod + [0-9]
                #"$mainMod, 1, workspace, 1"
                #"$mainMod, 2, workspace, 2"
                #"$mainMod, 3, workspace, 3"
                #"$mainMod, 4, workspace, 4"
                #"$mainMod, 5, workspace, 5"
                #"$mainMod, 6, workspace, 6"
                #"$mainMod, 7, workspace, 7"
                #"$mainMod, 8, workspace, 8"
                #"$mainMod, 9, workspace, 9"
                #"$mainMod, 0, workspace, 10"

            # Move active window to a workspace with mainMod + SHIFT + [0-9]
                #"$mainMod SHIFT, 1, movetoworkspace, 1"
                #"$mainMod SHIFT, 2, movetoworkspace, 2"
                #"$mainMod SHIFT, 3, movetoworkspace, 3"
                #"$mainMod SHIFT, 4, movetoworkspace, 4"
                #"$mainMod SHIFT, 5, movetoworkspace, 5"
                #"$mainMod SHIFT, 6, movetoworkspace, 6"
                #"$mainMod SHIFT, 7, movetoworkspace, 7"
                #"$mainMod SHIFT, 8, movetoworkspace, 8"
                #"$mainMod SHIFT, 9, movetoworkspace, 9"
                #"$mainMod SHIFT, 0, movetoworkspace, 10"

            # Example special workspace (scratchpad)
                #"$mainMod, S, togglespecialworkspace, magic"
                #"$mainMod SHIFT, S, movetoworkspace, special:magic"

            # Scroll through existing workspaces with mainMod + scroll
                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"

                "$mainMod, F, fullscreen,1"
                "$mainMod, ESCAPE, exec, wlogout"
                "$mainMod SHIFT, R, exec, ~/.config/waybar/launch.sh"

            ## volume ##
                ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume +5"
                ", XF86AudioLowerVolume , exec , swayosd-client --output-volume -5"
                ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"

            ## brightness ##
                ", XF86MonBrightnessUp , exec, swayosd-client --brightness raise"
                ", XF86MonBrightnessDown, exec, swayosd-client --brightness lower"

            ## Capslock ##
                ", --release Caps_Lock ,exec , swayosd-client --caps-lock"

                "$mainMod Shift, n, exec, swaync-client -t -sw"
            ];

            # Move/resize windows with mainMod + LMB/RMB and dragging
            bindm = [
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];
        };
    };
}
