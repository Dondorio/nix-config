{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    xwayland-satellite
  ];

  programs = {
    niri.enable = true;
    xwayland.enable = true;
  };
}
