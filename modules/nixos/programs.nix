{
  lib,
  pkgs,
  ...
}: {
  programs = {
    dconf.enable = true;
    firefox.enable = true;
    fish.enable = true;
    kdeconnect.enable = true;
    xfconf.enable = true;
    zsh.enable = true;

    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-media-tags-plugin
        thunar-vcs-plugin
        thunar-volman
      ];
    };

    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
      flake = "/home/donda/nix";
    };

    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs:
          with pkgs; [
            icu
            xorg.libxshmfence
          ];
      };
    };

    ssh.askPassword = lib.mkForce "${pkgs.kdePackages.ksshaskpass.out}/bin/ksshaskpass";
  };
}
