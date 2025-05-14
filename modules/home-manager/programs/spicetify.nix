{
  inputs,
  lib,
  ...
}: let
  pkgs-cad7255 = import inputs.nixpkgs-cad7255 {
    system = "x86_64-linux";
    config.allowUnfree = true;
  };
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs-cad7255.system};
in {
  # import the flake's module for your system
  imports = [inputs.spicetify-nix.homeManagerModules.default];

  # configure spicetify :)
  programs.spicetify = {
    enable = false;
    theme = lib.mkForce spicePkgs.themes.comfy;
    colorScheme = lib.mkForce "rose-pine-moon";

    enabledExtensions = with spicePkgs.extensions; [
      betterGenres
      bookmark
      fullAlbumDate
      hidePodcasts
      playNext
      powerBar
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      songStats
      wikify
    ];

    enabledCustomApps = with spicePkgs.apps; [
      localFiles
      lyricsPlus
    ];
  };

  home.packages = with pkgs-cad7255; [
    spotify
  ];
}
