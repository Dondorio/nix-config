{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-ng
    protontricks
  ];

  # ENV var for custom proton versions
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };

    gamemode = {
      enable = true;
    };
  };

  hardware.xone.enable = true; # support for the xbox controller USB dongle
}
