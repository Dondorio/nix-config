{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    osu-lazer
    mangohud
    protonup

    lunar-client
    atlauncher
    grapejuice
  ];

  programs.steam.enable = true;
  programs.steam.gamescopeSession.enable = true;
  programs.gamemode.enable = true;

  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS =
      "\${HOME}/.steam/root/compatibilitytools.d";
  };

}
