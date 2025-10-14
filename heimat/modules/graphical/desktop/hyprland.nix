{monitor, ...}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      inherit monitor;
      workspace = [
        "1, monitor:DP-1, default:true"
        "2, monitor:DP-1"
        "3, monitor:DP-1"
        "4, monitor:HDMI-A-1, default:true"
        "5, monitor:HDMI-A-1"
        "6, monitor:HDMI-A-1"
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "WLR_NO_HARDWARE_CURSORS,1"
        "NIXOS_OZONE_WL,1"
      ];

      windowrule = [
        # "float, ^(imv)$"
        # "float, ^(mpv)$"

        "float, class:(floating)"
        "size 622 652, class:(floating)"

        # "float, ^(wofi)$"
        # "stayfocused, ^(wofi)$"
        # "noborder, ^(wofi)$"
        #
        # "float, title:^(Bitwarden)$"

        "float, title:^(Picture in picture)$"
        "pin, title:^(Picture in picture)$"
        "size 678 384, title:^(Picture in picture)$"
        "move 1214 671, title:^(Picture in picture)$"
        "noinitialfocus, title:^(Picture in picture)$"
        #"float, ^(org.pulseaudio.pavucontrol)$"
        #"float, ^(.blueman-manager-wrapped)"
      ];

      exec-once = [
        "hyprpaper"
        "hypridle"
        "xrandr --output DP-1 --primary"
        "clipse -listen"
        "ashell"
      ];

      cursor = {
        no_hardware_cursors = true;
      };

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "eu";
        kb_variant = "";
        kb_options = "caps:swapescape";
        follow_mouse = 1;
        touchpad = {
          natural_scroll = true;
          scroll_factor = 0.25;
        };
        sensitivity = -0.7; # -1.0 - 1.0, 0 means no modification.
        numlock_by_default = true;
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      general = {
        gaps_in = 4;
        gaps_out = 8;
        border_size = 2;
        layout = "dwindle";
        # no_cursor_warps = false;
      };

      decoration = {
        rounding = 8;
        dim_inactive = true;
        dim_strength = 0.1;
        blur = {
          enabled = true;
          size = 6;
          passes = 3;
          new_optimizations = true;
        };

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
        };
      };

      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 4,  default, slidevert"
        ];
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        # render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

      "$mainMod" = "SUPER";
      "$menu" = "anyrun";

      bind = [
        "$mainMod, return, exec, kitty"
        "$mainMod, E, exec, kitty -e yazi"
        "$mainMod, B, exec, zen-twilight"
        # Application Launcher
        "$mainMod, space, exec, $menu"
        # "SUPER, SUPER_L, exec, fuzzel"
        # Clipboard History
        "$mainMod, V, exec, kitty --class floating -e 'clipse'" # Clipboard
        # Color Picker
        "$mainMod, I, exec, hyprpicker -a -f hex"

        # Spotify
        "$mainMod, S, exec, kitty -e spotify_player"
        "$mainMod SHIFT, S, exec, hyprshot -o ~/Pictures/Screenshots -m region -z "

        "$mainMod, Q, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, F, togglefloating,"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, G, fullscreen"
        "$mainMod, L, exec, swaylock --effect-blur 6x3"
        "$mainMod, P, exec, systemctl suspend"

        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, KP_END, workspace, 1"
        "$mainMod, KP_DOWN, workspace, 2"
        "$mainMod, KP_NEXT, workspace, 3"
        "$mainMod, KP_LEFT, workspace, 4"
        "$mainMod, KP_BEGIN, workspace, 5"
        "$mainMod, KP_RIGHT, workspace, 6"
        "$mainMod, KP_HOME, workspace, 7"
        "$mainMod, KP_UP, workspace, 8"
        "$mainMod, KP_PRIOR, workspace, 9"
        "$mainMod, KP_INSERT, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, KP_END, movetoworkspacesilent, 1"
        "$mainMod SHIFT, KP_DOWN, movetoworkspacesilent, 2"
        "$mainMod SHIFT, KP_NEXT, movetoworkspacesilent, 3"
        "$mainMod SHIFT, KP_LEFT, movetoworkspacesilent, 4"
        "$mainMod SHIFT, KP_BEGIN, movetoworkspacesilent, 5"
        "$mainMod SHIFT, KP_RIGHT, movetoworkspacesilent, 6"
        "$mainMod SHIFT, KP_HOME, movetoworkspacesilent, 7"
        "$mainMod SHIFT, KP_UP, movetoworkspacesilent, 8"
        "$mainMod SHIFT, KP_PRIOR, movetoworkspacesilent, 9"
        "$mainMod SHIFT, KP_INSERT, movetoworkspacesilent, 10"

        # Mute source
        ", Control_R, exec, pamixer --default-source -t"

        #  INFO: Currently unused

        # Keyboard backlight
        # "$mainMod, F3, exec, brightnessctl -d *::kbd_backlight set +33%"
        # "$mainMod, F2, exec, brightnessctl -d *::kbd_backlight set 33%-"

        # Brightness control
        # ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        # ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

        # Configuration files
        # ''$mainMod SHIFT, N, exec, kitty -e sh -c "rb"''
        # ''$mainMod SHIFT, C, exec, kitty -e sh -c "conf"''
        # ''$mainMod SHIFT, H, exec, kitty -e sh -c "nvim ~/nix/home-manager/modules/wms/hyprland.nix"''
        # ''$mainMod SHIFT, W, exec, kitty -e sh -c "nvim ~/nix/home-manager/modules/wms/waybar.nix''
        # '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

        # Laptop related
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -t"

        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        "SHIFT, XF86AudioRaiseVolume, exec, pamixer --default-source -i 5"
        "SHIFT, XF86AudioLowerVolume, exec, pamixer --default-source -d 5"
      ];

      bindm = [
        # Interact with Floating Windows
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
