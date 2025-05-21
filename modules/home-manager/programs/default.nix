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
    ./zellij.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    anki
    baobab
    cargo
    cargo-generate
    cargo-modules
    chromium
    clippy
    discord
    discordo
    fastfetch
    # floorp
    fuse
    helix
    jetbrains.idea-community-src
    kdePackages.kdenlive
    lf
    libtree
    mpv
    nautilus
    playerctl
    # popsicle
    rust-analyzer
    rustc
    rustfmt
    rustlings
    svelte-language-server
    vdhcoapp
    vesktop

    python3
    gcc
    git
    cmake
    man
    htop

    zulu17

    inputs.zen-browser.packages."${system}".default
  ];
}
