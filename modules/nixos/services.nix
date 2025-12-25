{...}: {
  services = {
    pulseaudio.enable = true;

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

    pipewire = {
      enable = false;
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
