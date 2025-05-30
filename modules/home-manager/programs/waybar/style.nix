{config, ...}: let
  b16 = config.lib.stylix.colors;
in {
  programs.waybar.style =
    /*
    css
    */
    ''
      * {
        font-family: JetBrains Mono, JetBrainsMono Nerd Font, Material Design Icons;
        font-size: 12px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        /* background-color: rgba(26, 27, 318, 0.5); */
        background-color: #${b16.base00};
        font-size: 12px;
        /* opacity: 0.5; */
        /* border-radius: 3rem; */
        /* margin: 1rem; */
        /* padding: 0px 2rem; */
        color: #${b16.base06};
        transition-property: background-color;
        transition-duration: 0.5s;
      }

      button:hover {
        background-color: #FFFFFF;
      }

      #backlight,
      #battery,
      #clock,
      #custom-wlogout,
      #mpris,
      #network,
      #pulseaudio,
      #syscontrol,
      #sysinfo,
      #tray,
      #workspaces
      {
        border-radius: 1rem;
        background-color: #${b16.base00};
        /* color: #${b16.base06}; */
        /* font-size: 1rem; */
        padding: 0.15rem 0.4rem;
        margin: 0.25rem 0.25rem;
        /* min-width: 2rem; */
      }

      #network, #pulseaudio { color: #${b16.base06}; }
      #backlight { color: #ecd3a0; }
      #battery {
        color: #8fbcbb;
      }

      /* Battery state-specific colors */
      #battery.warning { color: #ecd3a0; }
      #battery.critical:not(.charging) { color: #${b16.base08}; }

      #pulseaudio.muted { color: #${b16.base08}; }

      #cpu { color: #${b16.base0A}; }
      #temperature { color: #${b16.base0B}; }
      #memory { color: #${b16.base0C}; }

      #workspaces button {
        color: #${b16.base0B};
        background-color: #${b16.base0B};
        border-radius: 0.5rem;
        /* box-shadow: inset 0 -3px transparent; */
        /* padding: 3px 4px */
        transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
        min-width: 1rem;
        font-size: 0.5rem;
        /* height: 0.5rem; */

        margin: 0px 0.1rem;
        /* max-height: 0.5rem; */
      }

      #workspaces button.active {
        color: #${b16.base0D};
        background-color: #${b16.base0D};
        /* font-weight: bold; */
        /* border-radius: 8px; */
        transition: all 0.5s cubic-bezier(0.55, -0.68, 0.48, 1.68);
        min-width: 2rem;
      }

      #idle_inhibitor.activated {
        background-color: #${b16.base0D};
        color: #${b16.base0B};
      }

      /* Custom launcher */
      /* #custom-launcher { */
      /*   color: #${b16.base0B}; */
      /*   font-size: 22px; */
      /* } */

      tooltip {
        border-radius: 1rem;
        padding: 1rem;
        background-color: #${b16.base00};
      }

      tooltip label {
        padding: 0.5rem;
        font-size: 1rem;
        }

    '';
}
