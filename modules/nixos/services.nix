{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    sddm-sugar-dark
  ];

  services = {
    # xserver = {
    #   enable = true;
    #   desktopManager.gnome.enable = true;
    # };

    displayManager = {
      sddm = {
        enable = true;
        # theme = "sugar-dark";
      };
    };

    desktopManager = {
      plasma6.enable = true;
    };

    xserver.xkb = {
      layout = "pl";
      variant = "";
    };

    openssh.enable = true;

    printing.enable = true;

    pipewire = {
      enable = true;
      # package = pkgs.pulseaudioFull;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    # jack = {
    #   jackd.enable = true;
    #   alsa.enable = true;
    # };

    gnome = {
      gnome-keyring.enable = true;
    };

    gvfs.enable = true;
  };
}
