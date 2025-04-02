{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ../programs/waybar
  ];

  home.packages = with pkgs; [
    hyprpaper
    wl-clipboard
    hyprshot
    hyprpicker
  ];

  home.sessionVariables = {
    HYPRSHOT_DIR = "~/Pictures/Screenshots/hyprshot";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = null;
    systemd.variables = ["--all"];

    settings = {
      exec-once = [
        "waybar"
        "hyprpaper"
        "systemctl --user start plasma-polkit-agent" # Enable polkit for hyprland
      ];

      decoration = {
        rounding = 8;
        rounding_power = 2;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 0.9;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = lib.mkDefault "rgba(1a1a1aee)";
        };

        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 2;

          vibrancy = 0.1696;
        };
      };

      "$mod" = "SUPER";

      bindm = [
        # mouse movements
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod ALT, mouse:272, resizewindow"
      ];
      bind =
        [
          "$mod, Return, exec, $TERMINAL"
          "$mod, B, exec, $BROWSER"
          "$mod SHIFT, B, exec, pkill waybar && hyprctl dispatch exec waybar"
          "$mod, R, exec, $MENU -show drun"
          ", Print, exec, hyprshot -zm region"
          "SHIFT, Print, exec, hyprshot -zm output"

          "$mod ALT SHIFT, Q, exit"
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod SHIFT, F, pseudo"

          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, r"

          "$mod SHIFT, H, movefocus, l"
          "$mod SHIFT, J, movefocus, d"
          "$mod SHIFT, K, movefocus, u"
          "$mod SHIFT, L, movefocus, r"

          "$mod CTRL, H, movefocus, l"
          "$mod CTRL, J, movefocus, d"
          "$mod CTRL, K, movefocus, u"
          "$mod CTRL, L, movefocus, r"

          "ALT, Tab, cyclenext"
        ]
        ++ (
          # workspaces
          # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
          builtins.concatLists (builtins.genList (
              i: let
                ws = i + 1;
              in [
                "$mod, code:1${toString i}, workspace, ${toString ws}"
                "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
              ]
            )
            9)
        );

      binde = [
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        # Requires playerctl
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ];
    };
  };
}
