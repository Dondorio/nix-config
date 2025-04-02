{ pkgs, ... }:
{
  home.packages = with pkgs; [
    reaper
    
    yabridge
    yabridgectl
    musescore
    #vital
    #surge
    #surge-XT
    decent-sampler
  ];
}
