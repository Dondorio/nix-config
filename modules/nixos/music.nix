{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    reaper
    yabridge
    yabridgectl
    musescore
    vital
    surge-XT
    decent-sampler
  ];

}
