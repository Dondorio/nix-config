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

  users.users.donda = {
    isNormalUser = true;
    description = "Donda";
    extraGroups = ["networkmanager" "wheel" "music" "realtime" "docker" "jackaudio" "audio"];

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

  # Bootloader.
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
      theme = lib.mkForce pkgs.sleek-grub-theme;
    };
  };

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  i18n = {
    defaultLocale = "en_GB.UTF-8";

    extraLocaleSettings = {
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

    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5.addons = with pkgs; [
        fcitx5-mozc
        fcitx5-gtk
      ];
    };
  };

  console.keyMap = "pl2";

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

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

    victor-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu
    # nerd-fonts.cascadiacode
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
    };
  };

  networking = {
    hostName = "donda";

    networkmanager = {
      enable = true;
      insertNameservers = ["1.1.1.1"];
    };

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
    };
  };

  virtualisation = {
    containers.enable = true;

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.11";
}
