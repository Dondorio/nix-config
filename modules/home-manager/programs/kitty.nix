{
  programs.kitty = {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      cursor_shape = "beam";
      term = "xterm-256color";
      shell_integration = "disabled";
      open_url_with = "zen-browser";
      cursor_blink_interval = 0;
      cursor_trail = "1"; # Enable fancy cursor animations
      # background_opacity = "0.5";
      # background_blur = "40";

      # foreground = "#dbd7dd";
      # background = "#0d0613";
    };
    keybindings = {
      "ctrl+shift+n" = "";
      "ctrl+shift+b" = "";
    };
  };
}
