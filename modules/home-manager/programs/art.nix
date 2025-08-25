{pkgs, ...}: {
  home.packages = with pkgs; [
    blockbench
    krita
    krita-plugin-gmic
  ];
}
