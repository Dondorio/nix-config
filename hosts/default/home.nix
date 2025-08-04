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
      "application/pdf" = ["zen-beta.desktop"];
      "image/*" = ["org.kde.gwenview.desktop"];
      "video/*" = ["mpv.desktop"];
      "application/aseprite" = ["aseprite.desktop"];

      "default-web-browser" = ["zen-beta.desktop"];
      "text/html" = ["zen-beta.desktop"];
      "x-scheme-handler/http" = ["zen-beta.desktop"];
      "x-scheme-handler/https" = ["zen-beta.desktop"];
      "x-scheme-handler/about" = ["zen-beta.desktop"];
      "x-scheme-handler/unknown" = ["zen-beta.desktop"];
      # "x-scheme-handler/chrome" = ["zen-beta.desktop"];

      "application/x-extension-htm" = ["zen-beta.desktop"];
      "application/x-extension-html" = ["zen-beta.desktop"];
      "application/x-extension-xht" = ["zen-beta.desktop"];
      "application/x-extension-xhtml" = ["zen-beta.desktop"];
    };
  };
}
