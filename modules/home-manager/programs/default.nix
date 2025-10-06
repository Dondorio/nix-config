{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./art.nix
    ./eza.nix
    ./games.nix
    ./ghostty.nix
    ./kitty.nix
    ./music.nix
    ./rofi.nix
    ./starship.nix
    ./zellij.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    # popsicle
    alacritty
    alsa-oss
    anki
    bacon
    baobab
    bat
    cargo-generate
    cargo-info
    cargo-modules
    chromium
    clippy
    cmake
    discord
    fastfetch
    fd
    fuse
    gcc
    git
    gitui
    gleam
    helix
    htop
    kdePackages.kdenlive
    lf
    libtree
    man
    mpv
    nautilus
    playerctl
    python3
    ripgrep
    ripgrep-all
    rustc
    rustfmt
    rustlings
    vdhcoapp
    vesktop

    inputs.zen-browser.packages."${system}".default
  ];
}
