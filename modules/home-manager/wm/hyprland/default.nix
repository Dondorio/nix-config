{
  pkgs,
  lib,
  config,
  ...
}: let
  b16 = config.lib.stylix.colors;
in {
  imports = [
    ../../programs/waybar
    ../../services/mako.nix
    ../../services/swayosd.nix
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
    portalPackage = null;
    systemd.variables = ["--all"];

    settings = {
      exec-once = [
        "waybar"
        "hyprpaper"
        "nm-applet"
        "systemctl --user start plasma-polkit-agent" # Enable polkit for hyprland
        "systemctl --user import-environment PATH && systemctl --user restart xdg-desktop-portal.service"
      ];

      general = {
        border_size = 2;
        layout = "master";
      };

      decoration = {
        rounding = 6;
        rounding_power = 2;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 0.9;

        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          # color = lib.mkDefault "rgba(1a1a1aee)";
          color = lib.mkDefault "rgba(${b16.base03}ee)";
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

          # "$mod ALT SHIFT, Q, exit"
          "$mod ALT SHIFT, Q, exec, wlogout"
          "$mod, Q, killactive"
          "$mod, F, fullscreen"
          "$mod SHIFT, F, pseudo"
          "$mod, SPACE, togglefloating"

          "$mod, H, movefocus, l"
          "$mod, J, movefocus, d"
          "$mod, K, movefocus, u"
          "$mod, L, movefocus, r"

          "$mod SHIFT, H, movewindow, l"
          "$mod SHIFT, J, movewindow, d"
          "$mod SHIFT, K, movewindow, u"
          "$mod SHIFT, L, movewindow, r"

          "$mod CTRL, H, resizeactive, l"
          "$mod CTRL, J, resizeactive, d"
          "$mod CTRL, K, resizeactive, u"
          "$mod CTRL, L, resizeactive, r"

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
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
        ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
        # Requires playerctl
        ", XF86AudioPlay, exec, swayosd-client --playerctl=play-pause"
        ", XF86AudioPrev, exec, swayosd-client --playerctl=previous"
        ", XF86AudioNext, exec, swayosd-client --playerctl=next"
      ];
      # binde = [
      #   ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
      #   ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      #   ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      #   # Requires playerctl
      #   ", XF86AudioPlay, exec, playerctl play-pause"
      #   ", XF86AudioPrev, exec, playerctl previous"
      #   ", XF86AudioNext, exec, playerctl next"
      # ];
    };
  };
}
