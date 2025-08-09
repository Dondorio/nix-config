{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    #./anime-games-launcher.nix
    #./awesome
    ./art.nix
    ./eza.nix
    ./games.nix
    ./ghostty.nix
    ./kitty.nix
    ./music.nix
    ./rofi.nix
    ./spicetify.nix
    ./starship.nix
    ./zellij.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    alacritty
    # floorp
    # helix
    # popsicle
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
    discordo
    evil-helix
    fastfetch
    fd
    fuse
    gcc
    git
    gitui
    htop
    # jetbrains.idea-community-src
    kdePackages.kdenlive
    lf
    libtree
    man
    mpv
    nautilus
    ncspot
    playerctl
    python3
    ripgrep
    ripgrep-all
    rust-analyzer
    rustc
    rustfmt
    rustlings
    svelte-language-server
    vdhcoapp
    vesktop
    # zulu17

    inputs.zen-browser.packages."${system}".default
  ];
}
