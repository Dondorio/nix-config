{config, ...}: let
  hyprlandConf = config.wayland.windowManager.hyprland.settings;
in {
  services.mako = {
    enable = true;
    settings = {
      border-radius = hyprlandConf.decoration.rounding;
      border-size = hyprlandConf.general.border_size;

      default-timeout = 10000;
      ignore-timeout = true;
    };
  };
}
