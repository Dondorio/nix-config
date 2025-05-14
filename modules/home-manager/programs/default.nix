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
    #alsa-oss
    anki
    #appimage-run
    baobab
    cargo
    cargo-generate
    cargo-modules
    chromium
    discord
    discordo
    fastfetch
    floorp
    fuse
    helix
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
    svelte-language-server
    # ungit
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
