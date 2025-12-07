{...}: {
  programs.fish = {
    enable = true;

    shellAliases = {
      "nix-shell" = "nix-shell \$argv --run fish";
    };
  };
}
