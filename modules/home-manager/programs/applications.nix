{
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    #alsa-oss
    anki
    #appimage-run
    #atlauncher
    baobab
    #blockbench
    #brave
    cargo
    #chromium
    discord
    #discordo
    fastfetch
    #flameshot
    floorp
    fuse
    #heroic
    jetbrains.idea-community-src
    kdePackages.kdenlive
    #kitty
    lf
    libtree
    #lunar-client
    lutris
    mpv
    #miru
    nautilus
    #oranchelo-icon-theme
    playerctl
    #popsicle
    #quickemu
    rust-analyzer
    rustc
    rustfmt
    rustlings
    ungit
    #ungoogled-chromium
    vdhcoapp
    #vencord
    vesktop
    #webcord-vencord
    #wine

    gcc
    git
    cmake
    man
    htop

    inputs.zen-browser.packages."${system}".default
  ];
}
