{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
    '';
    shellAliases = {
      "nix-shell" = "nix-shell \$argv --run fish";
    };
  };
}
