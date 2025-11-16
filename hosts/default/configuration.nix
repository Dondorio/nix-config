{
  pkgs,
  inputs,
  lib,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos
  ];

  users.users.donda = {
    isNormalUser = true;
    description = "Donda";
    extraGroups = ["networkmanager" "wheel" "music" "realtime" "docker" "jackaudio" "audio"];

    shell = pkgs.zsh;
  };

  home-manager = {
    extraSpecialArgs = {inherit inputs;};

    useUserPackages = true;
    useGlobalPkgs = true;

    users = {
      "donda" = import ./home.nix;
    };

    backupFileExtension = "hm-backup";
  };

  environment.systemPackages = with pkgs; [
    home-manager

    fzf
    gh
    git
    gparted
    killall
    man
    wine64
    winetricks
  ];

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji

    annotation-mono
    iosevka
    nerd-fonts._0xproto
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu
    victor-mono
  ];

  time.timeZone = "Europe/Warsaw";

  console.keyMap = "pl2";
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

  networking = {
    hostName = "donda";

    networkmanager = {
      enable = true;
      insertNameservers = ["1.1.1.1"];
    };

    nftables.enable = true;
  };

  virtualisation = {
    containers.enable = true;

    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = ["gtk"];
    };
  };

  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = true;
      theme = lib.mkForce pkgs.catppuccin-grub;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];
  system.stateVersion = "24.11";
}
