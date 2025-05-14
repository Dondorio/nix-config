{pkgs, ...}: {
  home.packages = with pkgs; [
    # lunar-client
    lutris
    prismlauncher
  ];
}
