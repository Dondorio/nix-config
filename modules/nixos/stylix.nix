{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.stylix.nixosModules.stylix
  ];

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";

    cursor = {
      package = pkgs.capitaine-cursors;
      name = "capitaine-cursors-dark";
      size = 16;
    };

    fonts = {
      serif = {
        package = pkgs.noto-fonts;
        name = "Noto Serrif";
      };

      sansSerif = {
        package = pkgs.noto-fonts;
        name = "Noto Serrif";
      };

      monospace = {
        package = pkgs.annotation-mono;
        name = "Annotation Mono";
      };

      emoji = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
    };

    opacity = {
      terminal = 1.0;
      desktop = 0.9;
    };

    image = ../../assets/wallpapers/wallhaven-2k87eg.png;
  };
}
