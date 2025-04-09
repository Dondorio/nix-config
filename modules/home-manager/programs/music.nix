{pkgs, ...}: {
  home.packages = with pkgs; [
    reaper

    yabridge
    yabridgectl
    musescore
    muse-sounds-manager
    #vital
    #surge
    #surge-XT
    decent-sampler
  ];
}
