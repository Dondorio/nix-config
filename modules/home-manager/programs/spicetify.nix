{inputs, ...}: let
  pkgs-cad7255 = import inputs.nixpkgs-cad7255 {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };

  spicetify-nix = inputs.spicetify-nix;
  spicePkgs = spicetify-nix.legacyPackages.${pkgs-cad7255.system};
in {
  # import the flake's module for your system
  imports = [spicetify-nix.homeManagerModules.default];

  # configure spicetify :)
  programs.spicetify = {
    enable = false;
    theme = spicePkgs.themes.comfy;
    colorScheme = "rose-pine-moon";

    enabledExtensions = with spicePkgs.extensions; [
      fullAppDisplay
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
      betterGenres
      playNext
      powerBar
      wikify
      bookmark
    ];
  };

  home.packages = with pkgs-cad7255; [
    spotify
  ];
}
