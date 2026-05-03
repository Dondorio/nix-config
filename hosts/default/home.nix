{
  config,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home-manager
  ];

  home = {
    username = "donda";
    homeDirectory = "/home/donda";

    stateVersion = "25.11";
  };

  programs = {
    btop.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

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
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
    gtk4.theme = config.gtk.theme;
  };

  xdg.mime.enable = true;

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/*" = ["kate.desktop"];

      "image/gif" = ["org.kde.gwenview.desktop"];
      "image/jpeg" = ["org.kde.gwenview.desktop"];
      "image/png" = ["org.kde.gwenview.desktop"];

      "audio/*" = ["mpv.desktop"];
      "video/*" = ["mpv.desktop"];

      "application/aseprite" = ["aseprite.desktop"];
      "application/pdf" = ["zen-beta.desktop"];
      "application/zip" = ["org.kde.ark.desktop"];

      "default-web-browser" = ["zen-beta.desktop"];
      "text/html" = ["zen-beta.desktop"];
      "x-scheme-handler/about" = ["zen-beta.desktop"];
      "x-scheme-handler/http" = ["zen-beta.desktop"];
      "x-scheme-handler/https" = ["zen-beta.desktop"];
      "x-scheme-handler/unknown" = ["zen-beta.desktop"];

      "application/x-extension-htm" = ["zen-beta.desktop"];
      "application/x-extension-html" = ["zen-beta.desktop"];
      "application/x-extension-xht" = ["zen-beta.desktop"];
      "application/x-extension-xhtml" = ["zen-beta.desktop"];
    };
  };
}
