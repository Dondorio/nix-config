{
  programs.hyprland = {
    enable = true; # enable Hyprland
    xwayland.enable = true;
  };

  # Optional, hint Electron apps to use Wayland:
  # environment.sessionVariables = {
  #   NIXOS_OZONE_WL = "1";
  # };
}
