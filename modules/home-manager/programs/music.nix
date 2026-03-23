{pkgs, ...}: {
  home.packages = with pkgs; [
    muse-sounds-manager
    musescore
    reaper
    yabridge
    yabridgectl
    # decent-sampler
    #surge
    #surge-XT
    #vital
  ];
}
