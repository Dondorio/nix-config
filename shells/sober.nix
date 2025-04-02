{pkgs ? import <nixpkgs> {}}:
(pkgs.buildFHSEnv {
  name = "sober";
  targetPkgs = pkgs:
    (with pkgs; [
      udev
      alsa-lib
      libsecret
      gnome-keyring
      openssl
      curl
      freetype
      libz
      glib
      webkitgtk_6_0
      gtk4
      libsoup_3
      libadwaita
    ])
    ++ (with pkgs.xorg; [
      libX11
      libXcursor
      libXrandr
    ]);
  multiPkgs = pkgs: (with pkgs; [
    udev
    alsa-lib
  ]);
  runScript = "zsh";
})
.env
