{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    mangohud
    protontricks
    protonup-ng
    steamcmd
  ];

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
  };

  programs = {
    gamescope = {
      enable = true;
      capSysNice = false;
    };

    steam = {
      enable = true;
      gamescopeSession.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };

    gamemode = {
      enable = true;
    };
  };

  hardware.xone.enable = true;
}
