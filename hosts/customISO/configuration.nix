{
  pkgs,
  modulesPath,
  ...
}: {
  imports = [
    "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
  ];

  nixpkgs = {
    hostPlatform = "x86_64-linux";
    config.allowUnfree = true;
    config.allowUnfreePredicate = true;
  };

  environment.systemPackages = with pkgs; [
    gparted
    git
    killall
    kitty
    rustc
    rust-analyzer
    rustfmt
    clang
    clang-tools
    gcc
    cmake
    man
    btop
    cargo
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.ubuntu
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
  ];

  programs = {
    firefox.enable = true;
    # zsh.enable = true;
  };

  services = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      jack.enable = true;
    };
  };

  console.keyMap = "pl2";

  networking = {
    hostName = "nixos";
    wireless.enable = false;
    networkmanager.enable = true;
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  isoImage = {
    makeUsbBootable = true;
    makeEfiBootable = true;
  };
}
