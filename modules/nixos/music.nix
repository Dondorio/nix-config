{
  pkgs,
  inputs,
  ...
}: {
  inputs = [
    inputs.musnix.nixosModules.musnix
  ];

  environment.systemPackages = with pkgs; [
    helm
    vital
    surge
    surge-XT
  ];

  musnix = {
    enable = true;
  };
}
