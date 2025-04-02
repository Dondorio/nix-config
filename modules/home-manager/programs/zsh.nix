{pkgs, ...}: {
  home.packages = with pkgs; [
    oh-my-zsh
  ];

  programs.zsh = {
    enable = true;

    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "sorin";
      plugins = [
        "git"
        "sudo" # Esc x 2
        "web-search" # Google "search term here without quotes"
        #"copy-dir"
        "dirhistory" # Alt + arrow keys
      ];
    };
  };
}
