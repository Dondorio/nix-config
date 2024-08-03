{ config, pkgs, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../../modules/home-manager
  ];

  home.username = "donda";
  home.homeDirectory = "/home/donda";

  home.stateVersion = "24.05";

  home.packages = [
    pkgs.oh-my-zsh
    # dconf

    (pkgs.writeShellScriptBin "my-hello" ''
       echo "Hello, ${config.home.username}!" '')
  ];
  
  programs.git = {
    enable = true;
    userName = "Emily";
    # userEmail = "";
    extraConfig = {
      init.defaultBranch = "main";
      
    };
  };

  #gtk = {
  #   enable = true;
  #   theme.name = "";
  #   cursorTheme.name = "";
  #   iconTheme.name = "";
  # };

  home.sessionVariables = {
    EDITOR = "nvim";
	  SUDO_EDITOR = "nvim";
	  BROWSER = "floorp";
	  TERMINAL = "kitty";

  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "kate.desktop" ];
    "application/pdf" = [ "floorp.desktop" ];
    "image/*" = [ "gwenview.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "application/aseprite" = [ "aseprite.desktop" ];

  };

  programs.home-manager.enable = true;
}
