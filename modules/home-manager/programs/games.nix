{pkgs, ...}: {
  home.packages = with pkgs; [
    lunar-client
    lutris
    nexusmods-app-unfree
    (prismlauncher.override {
      jdks = [
        zulu
        zulu17
        zulu8
      ];
    })
  ];
}
