{pkgs, ...}: {
  imports = [
    ./style.nix
  ];

  home.packages = with pkgs; [
    networkmanagerapplet
    mako
    libnotify
    pamixer
  ];

  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        height = 20;
        # margin = "4rem";
        # spacing = ;
        layer = "top";

        modules-left = [
          "custom/launcher"
          "mpris"
          "custom/weather"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "network"
          "custom/wg"
          "pulseaudio"
          "group/sysinfo"
          "backlight"
          "battery"
          "tray"
          # "hyprland/language"
          # "custom/wallpaper"
          "idle_inhibitor"
          "custom/refresh-rate"
          "clock"
        ];

        "hyprland/workspaces" = {
          # format = "{name}";
          format = " ";
          all-outputs = true;
          on-click = "activate";
          format-icons = {
            active = "󱎴";
            default = "󰍹";
          };

          # persistent-workspaces = {
          #   "1" = [];
          #   "2" = [];
          #   "3" = [];
          #   "4" = [];
          #   "5" = [];
          #   "6" = [];
          #   "7" = [];
          #   "8" = [];
          #   "9" = [];
          # };
        };

        # "hyprland/language" = {
        #   format = "{}";
        #   format-en = "🇬🇧 ";
        # };

        "tray" = {
          spacing = 10;
        };

        "clock" = {
          format = "{:%H:%M}";
          # format-alt = "{:%b %d %Y}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };

        "cpu" = {
          interval = 30;
          format = "CPU: {}%";
          max-length = 10;
        };

        "temperature" = {
          interval = 30;
          format = "TEMP: {temperatureC}°C ";

          warning-threshold = 55;
          format-warning = "TEMP: {temperature}°C ";

          critical-threshold = 60;
          format-critical = "TEMP: {temperature}°C ";
        };

        "memory" = {
          interval = 30;
          # format = "RAM: {}%";
          format = "RAM: {used:0.1f}GB";
          max-length = 10;
        };

        "group/sysinfo" = {
          orientation = "inherit";
          modules = [
            "cpu"
            "temperature"
            "memory"
          ];

          on-click = "kitty -e btop";
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{icon}";
          tooltip = true;
          format-alt = "<small>{percent}%</small>";
          format-icons = ["󱩎" "󱩏" "󱩐" "󱩑" "󱩒" "󱩓" "󱩔" "󱩕" "󱩖" "󰛨"];
          on-scroll-up = "brightnessctl set 1%+";
          on-scroll-down = "brightnessctl set 1%-";
          smooth-scrolling-threshold = "2400";
          tooltip-format = "Brightness {percent}%";
        };

        "network" = {
          format-wifi = "{bandwidthDownBytes} {icon}";
          min-length = 10;
          fixed-width = 10;
          format-ethernet = "󰈀";
          format-disconnected = "󰤭";
          tooltip-format = "{essid}";
          interval = 1;
          on-click = "rofi-network-manager";
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
        };

        # "custom/wg" = {
        #   exec = "~/.config/hypr/scripts/wg-status.sh";
        #   interval = 5;
        #   format = "{}";
        #   on-click = "~/.config/hypr/scripts/wg-toggle.sh";
        # };

        "pulseaudio" = {
          format = "{icon} {volume}%";
          format-muted = "󰖁";
          format-icons = {
            default = ["" "" ""];
          };
          on-click = "pamixer -t";
          on-scroll-up = "pamixer -i 1";
          on-scroll-down = "pamixer -d 1";
          on-click-right = "exec pavucontrol";
          tooltip-format = "Volume {volume}%";
        };

        "battery" = {
          # bat = "BAT0";
          # adapter = "ADP0";
          interval = 60;
          states = {
            warning = 15;
            critical = 7;
          };
          max-length = 20;
          format = "{icon}";
          format-warning = "{icon}";
          format-critical = "{icon}";
          format-charging = "<span font-family='Font Awesome 6 Free'></span>";
          format-plugged = "󰚥";
          format-notcharging = "󰚥";
          format-full = "󰂄";
          format-alt = "<small>{capacity}%</small>";
          format-alt-warning = "<small>{capacity}%</small>";
          format-critical-alt = "<small>{capacity}%</small>";
          format-icons = ["󱊡" "󱊢" "󱊣"];
        };

        # "custom/weather" = {
        #   format = "{}°C";
        #   tooltip = true;
        #   interval = 3600;
        #   exec = "wttrbar --location Lodz";
        #   return-type = "json";
        # };

        "mpris" = {
          format = "{player_icon} {title}";
          format-paused = "{status_icon} {title}";
          max-length = 80;
          player-icons = {
            default = "";
            spotify = " ";
          };

          status-icons = {
            paused = "";
            spotify = " ";
          };

          on-click = "playerctl play-pause";
        };

        # "custom/refresh-rate" = {
        #   format = "{percentage}Hz";
        #   on-click = "~/.config/hypr/scripts/screenHz.sh";
        #   return-type = "json";
        #   exec = "cat ~/.config/hypr/scripts/hz.json";
        #   interval = 1;
        #   tooltip = false;
        # };

        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "󰈈";
            deactivated = "";
          };
        };

        "custom/launcher" = {
          format = "Applications";
          on-click = "rofi -show drun";
        };

        # "custom/wallpaper" = {
        #   format = "󰸉 ";
        #   on-click = "bash ~/.config/hypr/scripts/changewallpaper.sh";
        # };
      };
    };
  };
}
