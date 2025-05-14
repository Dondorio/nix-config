{pkgs, ...}: {
  imports = [
    ../../modules/home-manager
  ];

  #   backupFileExtension = "backup";

  home = {
    username = "donda";
    homeDirectory = "/home/donda";

    stateVersion = "24.05";
  };

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # (pkgs.writeShellScriptBin "my-hello" ''
    #     echo "Hello, ${config.home.username}!" '')
    capitaine-cursors
    papirus-icon-theme
  ];

  fonts.fontconfig.enable = true;

  programs = {
    # git = {
    #   enable = true;
    #   userName = "Donda";
    #   # userEmail = "";
    #   extraConfig = {
    #     init.defaultBranch = "main";
    #   };
    # };

    btop.enable = true;

    home-manager.enable = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    BROWSER = "zen";
    TERMINAL = "kitty";
    MENU = "rofi";
  };

  gtk = {
    enable = true;
    cursorTheme.name = "capitaine-cursors";
    iconTheme.name = "papirus-icon-theme-pink-folders";
    # theme.name = "";
  };

  #define default apps for mime type
  xdg.mime.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = ["kate.desktop"];
      "application/pdf" = ["zen.desktop"];
      "image/*" = ["gwenview.desktop"];
      "video/*" = ["mpv.desktop"];
      "application/aseprite" = ["aseprite.desktop"];

      "default-web-browser" = ["zen.desktop"];
      "text/html" = ["zen.desktop"];
      "x-scheme-handler/http" = ["zen.desktop"];
      "x-scheme-handler/https" = ["zen.desktop"];
      "x-scheme-handler/about" = ["zen.desktop"];
      "x-scheme-handler/unknown" = ["zen.desktop"];
      # "x-scheme-handler/chrome" = ["zen.desktop"];

      "application/x-extension-htm" = ["zen.desktop"];
      "application/x-extension-html" = ["zen.desktop"];
      "application/x-extension-xht" = ["zen.desktop"];
      "application/x-extension-xhtml" = ["zen.desktop"];
    };
  };
}
