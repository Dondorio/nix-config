{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      pane_frames = false;
      show_startup_tips = false;

      ui = {
        pane_frames = {
          rounded_corners = true;
        };
      };
    };
  };
}
