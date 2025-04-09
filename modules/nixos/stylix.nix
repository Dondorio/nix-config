{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  # environment.systemPackages = with pkgs; [
  #   capitaine-cursors
  # ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    # base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    # polarity = "dark";
    # targets.kde.enable = false;
    # targets.qt.enable = false;
    # terracotta-dark
    # rose-pine-moon

    # cursor = {
    #   package = pkgs.capitaine-cursors;
    #   name = "capitaine-cursors-dark";
    #   size = 16;
    # };

    opacity = {
      terminal = 0.9;
      desktop = 0.9;
    };

    image = ../../assets/wallpapers/wallhaven-2k87eg.png;

    # targets = {
    #   waybar.enable = false;
    # };
    # targets.waybar.enable = false;
  };
}
