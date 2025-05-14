{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix

    ../../modules/nixos/nvidia.nix
    ../../modules/nixos
  ];

  boot.kernelModules = ["coretemp"];

  # Bootloader.
  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
    useOSProber = true;
  };

  networking = {
    hostName = "donda"; # Define your hostname.
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

    # Enable networking
    networkmanager.enable = true;
    # wireless.enable = true;
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pl_PL.UTF-8";
    LC_IDENTIFICATION = "pl_PL.UTF-8";
    LC_MEASUREMENT = "pl_PL.UTF-8";
    LC_MONETARY = "pl_PL.UTF-8";
    LC_NAME = "pl_PL.UTF-8";
    LC_NUMERIC = "pl_PL.UTF-8";
    LC_PAPER = "pl_PL.UTF-8";
    LC_TELEPHONE = "pl_PL.UTF-8";
    LC_TIME = "pl_PL.UTF-8";
  };

  services = {
    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
    };

    displayManager = {
      sddm.enable = true;
    };

    desktopManager = {
      plasma6.enable = true;
    };

    # Configure keymap in X11
    xserver.xkb = {
      layout = "pl";
      variant = "";
    };
    # Enable the OpenSSH daemon.
    openssh.enable = true;

    # Enable CUPS to print documents.
    printing.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;
    };

    gnome = {
      gnome-keyring.enable = true;
    };

    gvfs.enable = true;
  };

  # Configure console keymap
  console.keyMap = "pl2";

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  # use the example session manager (no others are packaged yet so this is enabled by default,
  # no need to redefine it in your config for now)
  #media-session.enable = true;

  users.users.donda = {
    isNormalUser = true;
    description = "Donda";
    extraGroups = ["networkmanager" "wheel" "music" "realtime" "docker"];

    packages = with pkgs; [
      kdePackages.kate
      kdePackages.gwenview
      lm_sensors
    ];

    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};

    users = {
      "donda" = import ./home.nix;
    };

    backupFileExtension = "hm-backup";
  };

  programs = {
    firefox.enable = true;
    dconf.enable = true;
    zsh.enable = true;

    nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep-since 4d --keep 3";
      };
      flake = "/home/donda/nix";
    };

    appimage = {
      enable = true;
      binfmt = true;
      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: [pkgs.xorg.libxshmfence];
      };
    };

    ssh.askPassword = lib.mkForce "${pkgs.plasma5Packages.ksshaskpass.out}/bin/ksshaskpass";
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = true;

  environment.systemPackages = with pkgs; [
    # node
    # nodejs_23
    # polkit_gnome
    # wine
    base16-schemes
    cargo-cross
    clang
    fzf
    gh
    git
    glib
    glib-networking
    gnumake
    gparted
    gtk3
    home-manager
    killall
    ninja
    rustup
    webkitgtk_4_1
    wine64
    winetricks
    yarn
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    #     noto-fonts-cjk-sans
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts

    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu
    # nerd-fonts.cascadiacode
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];

  #Fcitx
  #   i18n.inputMethod = {
  #    enable = true;
  #    type = "fcitx5";
  #    fcitx5.addons = with pkgs; [
  #        fcitx5-mozc
  #        fcitx5-gtk
  #    ];
  #   };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
    };
  };

  # Networking stuff
  networking = {
    networkmanager.insertNameservers = ["1.1.1.1"];
    nftables.enable = true;
    firewall = {
      enable = false;
      allowedTCPPorts = [22 80 443];
      allowedUDPPortRanges = [
        {
          from = 4000;
          to = 4007;
        }
        {
          from = 8000;
          to = 8010;
        }
      ];
      rejectPackets = true;

      #allowPing = true;
    };
  };

  virtualisation = {
    containers.enable = true;

    podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };

    docker = {
      enable = false;
      # enableOnBoot = true;
      # rootless = {
      #   enable = true;
      #   setSocketVariable = true;
      # };
    };
  };

  #networking.nftables.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "24.11"; # Did you read the comment?
}
