{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.musnix.nixosModules.musnix
  ];

  environment.systemPackages = with pkgs; [
    helm
    vital
    surge
    surge-XT
    # carla
    alsa-tools
    pavucontrol
  ];

  musnix = {
    enable = true;
    alsaSeq.enable = true;
    ffado.enable = true;
  };
}
