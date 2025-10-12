{pkgs, ...}: {
  home.packages = with pkgs; [
    lunar-client
    lutris
    nexusmods-app-unfree
    (prismlauncher.override {
      jdks = [
        zulu8
        zulu17
        zulu
      ];
    })
  ];
}
