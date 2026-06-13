{...}: {
  services = {
    displayManager = {
      sddm = {
        enable = true;
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

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      jack.enable = true;
    };

    gnome = {
      gnome-keyring.enable = true;
    };

    gvfs.enable = true;

    tumbler.enable = true; # Thumbnail support for thunar
  };
}
