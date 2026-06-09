{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./art.nix
    ./eza.nix
    ./fish.nix
    ./games.nix
    ./ghostty.nix
    ./kitty.nix
    ./music.nix
    ./programming.nix
    ./rofi.nix
    ./starship.nix
    ./zellij.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    alsa-oss
    anki
    baobab
    bat
    calibre
    chromium
    discord
    gitui
    helix
    htop
    kdePackages.gwenview
    kdePackages.kate
    kdePackages.kdenlive
    mpv
    nautilus
    playerctl
    qbittorrent
    ripgrep
    ripgrep-all
    vesktop
    yazi

    inputs.zen-browser.packages."${stdenv.hostPlatform.system}".default
  ];
}
