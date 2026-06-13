{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./laptop.nix
    ../../modules/nixos
  ];

  users.users.donda = {
    isNormalUser = true;
    description = "Donda";
    extraGroups = ["networkmanager" "wheel" "music" "realtime" "docker" "jackaudio" "audio"];

    shell = pkgs.fish;
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
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji

    annotation-mono
    cozette
    iosevka
    maple-mono.CN
    maple-mono.opentype
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
      LC_TIME = "en_GB.UTF-8";
    };

    supportedLocales = [
      "en_US.UTF-8/UTF-8"
      "en_GB.UTF-8/UTF-8"
      "pl_PL.UTF-8/UTF-8"
    ];
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
      common.default = ["kde"];
    };
  };

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
      timeout = 5;
    };
  };

  nixpkgs.config = {
    allowUnfree = true;
    allowUnfreePredicate = true;
  };

  nixpkgs.overlays = [
    (final: prev: {
      inherit
        (prev.lixPackageSets.stable)
        nixpkgs-review
        nix-eval-jobs
        nix-fast-build
        colmena
        ;
    })
  ];

  nix.package = pkgs.lixPackageSets.stable.lix;

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "donda"];
    };
  };

  system.stateVersion = "25.11";
}
