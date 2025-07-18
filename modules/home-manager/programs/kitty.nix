{
  programs.kitty = {
    enable = true;

    shellIntegration = {
      enableZshIntegration = true;
    };

    settings = {
      confirm_os_window_close = 0;
      cursor_shape = "beam";
      # term = "xterm-kitty";
      shell_integration = "disabled";
      # open_url_with = "zen.desktop";
      cursor_blink_interval = 0;
      cursor_trail = "1"; # Enable fancy cursor animations
    };

    keybindings = {
      "ctrl+shift+n" = "";
      "ctrl+shift+b" = "";

      "ctrl+0" = "change_font_size all 0";
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+equal" = "change_font_size all +1.0";
      "ctrl+plus" = "change_font_size all +1.0";
    };
  };
}
