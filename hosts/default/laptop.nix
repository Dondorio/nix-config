{
  config,
  pkgs,
  ...
}: {
  services.xserver.videoDrivers = ["nvidia"];

  environment.systemPackages = with pkgs; [
    nvtopPackages.full
  ];

  hardware = {
    cpu.intel.updateMicrocode = true;

    nvidia = {
      powerManagement = {
        enable = true;
        finegrained = false;
      };

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };

        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };

      modesetting.enable = true;
      nvidiaSettings = true;
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        intel-media-driver
        libvdpau-va-gl
        intel-vaapi-driver
        libva-vdpau-driver
      ];
    };

    bluetooth = {
      enable = true;
    };
  };
}
