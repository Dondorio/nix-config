{pkgs, ...}: {
  services.swayosd = {
    enable = true;
  };

  home.packages = with pkgs; [
    swayosd
  ];
}
