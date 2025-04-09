{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    #./anime-games-launcher.nix
    #./awesome
    ./art.nix
    ./games.nix
    ./kitty.nix
    ./music.nix
    ./rofi.nix
    ./spicetify.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    #alsa-oss
    anki
    #appimage-run
    baobab
    cargo
    chromium
    discord
    discordo
    fastfetch
    floorp
    fuse
    jetbrains.idea-community-src
    kdePackages.kdenlive
    lf
    libtree
    lutris
    mpv
    nautilus
    # oranchelo-icon-theme
    playerctl
    # popsicle
    # quickemu
    rust-analyzer
    rustc
    rustfmt
    rustlings
    # ungit
    vdhcoapp
    vesktop
    wine

    gcc
    git
    cmake
    man
    htop

    inputs.zen-browser.packages."${system}".default
  ];
}
