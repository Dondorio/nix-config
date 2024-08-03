{ pkgs, ... }:

{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Ubuntu" "CascadiaCode" "JetBrainsMono" ]; })

    picom-pijulius
    #rofi


    light
    networkmanagerapplet
    alsa-utils
    #nitrogen
    playerctl
    redshift
    scrot
    gpick
    papirus-icon-theme
    
  ];


  home.file = {
    ".config/awesome/rc.lua" = {
      recursive = true;
      source = ./rc.lua;
    };
    
    ".config/awesome/theme.lua" = {
      recursive = true;
      source = ./theme.lua;
    };
    
    ".config/picom/picom.conf" = {
      recursive = true;
      source = ./picom.conf;
    };

  };
}
