{
  lib,
  pkgs,
  ...
}: {
  programs = {
    firefox.enable = true;
    dconf.enable = true;
    zsh.enable = true;

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
        extraPkgs = pkgs: [pkgs.xorg.libxshmfence];
      };
    };

    ssh.askPassword = lib.mkForce "${pkgs.plasma5Packages.ksshaskpass.out}/bin/ksshaskpass";
  };
}
