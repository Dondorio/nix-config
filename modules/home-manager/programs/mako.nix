{config, ...}: let
  hyprlandConf = config.wayland.windowManager.hyprland.settings;
in {
  services.mako = {
    enable = true;
    settings = {
      borderRadius = hyprlandConf.decoration.rounding;
      borderSize = hyprlandConf.general.border_size;

      defaultTimeout = 10000;
      ignoreTimeout = true;
    };
  };
}
